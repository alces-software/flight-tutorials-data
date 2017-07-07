#==============================================================================
# Copyright (C) 2017 Stephen F. Norledge and Alces Flight Ltd.
#
# This file is part of Flight Tutorials.
#
# All rights reserved, see LICENSE.txt.
#==============================================================================

source 'http://rubygems.org'
ruby ENV['ALCES_RUBY_VERSION'] || '2.4.1'

git_source(:github) do |repo_name|
  repo_name = "#{repo_name}/#{repo_name}" unless repo_name.include?("/")
  "https://github.com/#{repo_name}.git"
end

gem 'commander'
