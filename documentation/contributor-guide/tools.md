<h1>Contributor Tools</h1>

## Introduction

The three primary development tools I use for 7-Iron Cookbook development are:

1. ChefDK
2. Rake
3. Packer

Currently, the primary testing tool is Serverspec.  

**All tools are optional**, as long as the feature you commit has proper test coverage and does not require other contributors to add to much to their own tool chain.

## ChefDK

To use, download and install the [Chef Development Kit](https://downloads.getchef.com/chef-dk/)

After install, run `which chef` to confirm chef is in your path.

You should see something like: `/opt/chefdk/bin/chef`

Run `chef verify` to confirm Chef has installed correctly.

ChefDK comes with a number of embedded rubies.  You have (at least) four options for running ChefDK in a way that ensures you are using the ChefDK specific gems.

1.  If you only use ruby for ChefDK development, you can [follow these](https://github.com/opscode/chef-dk#using-chefdk-as-your-primary-development-environment) instructions to put the ChefDK ruby and gems paths first in you bash shell.  
2. Add the ChefDK gem paths to your .gemrc file manually.  
3. Run `chef shell-init` when you start a shell session for development.  This will ensure your environment settings use ChefDK specific bins and paths.
4. Prefix each dev command with `chef exec`. Such as: `chef exec kitchen-list`.  You can make this easier with bash aliases.  

For myself, I use method number `1` and then comment it out if I do any ruby work that needs different gems.  You could use ruby env to make it easier to switch between ruby versions.

ChefDK is composed of:

- [Chef](https://www.getchef.com/) - automates the build, deploy, and management of infrastructure.
- [Berkshelf](http://berkshelf.com/) - handles cookbook dependencies
- [KitchenCI](http://kitchen.ci/) - (aka Chef Kitchen, aka Test Kitchen) is one of the main tools we use for development.  
- [ChefSpec](http://chefspec.org/) -  a unit testing framework for testing Chef cookbooks (currently we are not using ChefSpec)
- [Foodcritic](http://foodcritic.io/) - a cookbook lint tool

## Rake

ChefDK will install with a number of embedded ruby gems, including [Rake](https://github.com/jimweirich/rake).  
Rake is a make-like build utility for Ruby.

We use rake to automate some of our development and build tasks.

## Packer

> Packer is a tool for creating identical machine images for multiple platforms from a single source configuration.
> -- https://packer.io/

It builds our Vagrant box.

## Serverspec

> Tests for servers configured by Puppet, Chef or anything else.
> -- http://serverspec.org/

Currently all tests are written with [ServerSpec](http://serverspec.org/), which works well for us because our application cookbook builds a server.

See: [Server Specs](server-specs.md).

## Miscellaneous Tools

- [knife-cookbook-doc](https://github.com/realityforge/knife-cookbook-doc)
    - Autogenerates a cookbook README file from cookbook code
    - The template for the README file is in `scripts/README.md.erb`
- [Chef Knife](http://docs.getchef.com/chef/knife.html)
    - Part of ChefDK
    - Runs the `knife cookbook doc` subcommand to generate README
    - **To use, you must first run** `knife configure`.  You can accept the defaults.
- [MkDocs](http://www.mkdocs.org/)
    - Generates project documentation as static html files
    - Uses the markdown source files located in the `documentation` directory
    - Serves a documentation site preview in a browser for review before publishing
