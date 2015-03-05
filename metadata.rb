# Contains meta data about the cookbook, such as machine name, version, and
# maintainers.  Contains a list of dependencies (other cookbooks) with their
# version numbers.  This helps lock dependency versions between 7-Iron releases.
#
# Note: We break the anti-pattern of setting a run list in a role.
# We also add this entry: `metadata` in the Berksfile so Berkshelf will refer to
# this file to manage our dependencies.  For more info see:
# https://docs.getchef.com/essentials_cookbook_metadata.html
#
# Copyright 2015 Sean P. Buscay
#
#  Licensed under the Apache License, Version 2.0 (the "License");
#  you may not use this file except in compliance with the License.
#  You may obtain a copy of the License at
#
#      http://www.apache.org/licenses/LICENSE-2.0
#
#  Unless required by applicable law or agreed to in writing, software
#  distributed under the License is distributed on an "AS IS" BASIS,
#  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
#  See the License for the specific language governing permissions and
#  limitations under the License.
#

name '7-Iron'
maintainer 'Sean Buscay'
maintainer_email 'sbuscay@seanbuscay.com'
license 'MIT'
description '7-Iron Builds A LAMP Server in a Vagrant Box for PHP and Drupal
Development'
long_description <<-desc
7-Iron is a:

1. LAMP Server in a Vagrant Box for PHP and Drupal developers
2. Cookbook you can use to build your own custom LAMP server
                  desc
version '0.0.1'
supports 'ubuntu', '>= 14.04'

depends 'apt', '~> 2.5.3'
depends 'build-essential'
depends 'apache2', '~> 2.0.0'
depends 'hostsfile', '~> 2.4.5'
depends 'git', '~> 4.0.2'
depends 'mysql', '5.5.0'
depends 'composer', '~> 1.0.5'
depends 'drush', '~> 0.9.0'
depends 'php', '~> 1.4.6'
depends 'curl', '~> 2.0.0'
depends 'xdebug', '~> 1.0.0'
depends 'ruby', '~> 0.9.3'
depends 'gem_installer', '~> 0.1.2'
depends 'bash', '~> 0.1.2'
