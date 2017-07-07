#!/usr/bin/env ruby

require "pathname"
ENV["BUNDLE_GEMFILE"] ||= File.expand_path("../Gemfile",
                                           Pathname.new(__FILE__).realpath)
require "rubygems"
require "bundler/setup"

require 'commander'
require 'yaml'
require 'json'

class TutorialBuilder
  include Commander::Methods

  def run
    program :name, 'tutorial_builder'
    program :version, '0.0.1'
    program :description, 'Compile and upload tutorial yml files to s3'

    command 'compile' do |c|
      c.syntax = 'compile [options] TUTORIAL_INPUT..'
      c.option '--output FILE', String, 'File to write output to'
      c.action do |args, options|
        tutorials = []
        args.each do |tutorial_path|
          tutorials << YAML.load_file(tutorial_path)
        end

        json = { tutorials: tutorials }.to_json

        if options.output
          File.write(options.output, json)
        else
          STDOUT.puts(json)
        end
      end
    end

    command 'upload' do |c|
      c.syntax = 'upload [options] TUTORIAL_OUTPUT...'
      c.option '--bucket BUCKET', String, 'The bucket prefix to upload the files to.'

      c.action do |args, options|
        options.default :bucket => 's3://alces-flight/FlightTutorials/tutorials/'

        args.each do |tutorial_path|
          JSON.parse(File.read(tutorial_path))  # Sanity check.
          s3_path = "#{options.bucket}#{tutorial_path}"

          `aws s3 cp --acl=public-read #{tutorial_path} #{s3_path}`
        end
      end
    end

    run!
  end
end

Compile.new.run if $0 == __FILE__
