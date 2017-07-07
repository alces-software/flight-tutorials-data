# Flight tutorials data

Data files and programs to generate Alces Flight tutorials.

## Quick start

Install dependencies:

```
bundle install
```

Build a single tutorial file and upload to s3:

```
bundle exec tutorial_builder.rb compile challenge.yml --output my-test-challenge.json
bundle exec tutorial_builder.rb upload my-test-challenge.json
```

Build a tutorial set and upload to s3.  Using the resulting tutorial file will
allow the user to select which tutorial they wish to run.

```
bundle exec tutorial_builder.rb compile challenge.yml pegamoose.yml --output combined-tutorials.json
bundle exec tutorial_builder.rb upload combined-tutorials.json
```

## Loading a tutorial

 1. Launch an instance of Flight Compute.
 2. Install and enable the `alces-flight-tutorials` clusterware service.
 3. Visit the website for your Flight Compute cluster.
 4. Navigate to Resources, select tutorials and follow the links.
 5. Add `?tutorials=combined-tutorials` to the URL.
