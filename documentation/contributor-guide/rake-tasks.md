<h1>Rake Tasks for Development</h1>

## Introduction

If you have [Rake](https://github.com/ruby/rake) installed then you can use the 7-Iron's Rake Tasks to assist in your development workflow.

## Rake Tasks List

To see a list of all Rake tasks run `rake la` from the top level of the 7-Iron project directory.

The results will look something like this:

~~~shell
rake add:recipe               # Add new recipe file: Usage `rake add:recipe name="Recipe Name"`
rake add:spec                 # Add new spec file: Usage `rake add:spec name="Test Name" desc="Test Description"`
rake build                    # Build 7-Iron Vagrant Box and put it in the build directory
rake la                       # Lists all Rake tasks and descriptions
rake lint                     # Run all style checks
rake list                     # Lists all Rake tasks
rake make:buildpaths          # Make build paths
rake make:cookbooks           # Make Berks vendor cookbooks directory for packer build
rake make:docs                # Make documentation
rake make:docs_server         # Make documentation server
rake make:ovf                 # Make virtualbox-ovf for packer to build from
rake make:readme              # Make README.md
rake make:vagrantfile         # Make Vagrantfile
rake packer:build             # Build from Packer template
rake packer:inspect           # Inspect Packer template
rake packer:validate          # Validate Packer template
rake set:all                  # Set all vars
rake set:git_vars             # Get branch and revision from git
rake set:releasetag           # Set Release Tag
rake set:version              # Set cookbook version from metadata.rb
rake style:chef               # Run Chef style checks
rake style:ruby               # Run Ruby style checks
rake style:ruby:auto_correct  # Auto-correct RuboCop offenses
~~~


*Tip:*  [Add bash auto completion for rake](http://turadg.aleahmad.net/2011/02/bash-completion-for-rake-tasks/)
