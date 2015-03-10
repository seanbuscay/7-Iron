# Cookbook Name:: 7-Iron
# Recipe:: default
#
# Note: Each recipe is covered by a test.
# Comments next to the recipe names its test.
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

=begin
#<
Install and configure a LAMP stack for php (Drupal-centric) web development.

**7-Iron is an application cookbook with one default recipe** to serve as the
application run list.

Here is the default recipe run list:

~~~ruby
include_recipe 'apt'                        # 7-Iron System Test
include_recipe 'build-essential'            # 7-Iron System Test
include_recipe 'curl'                       # 7-Iron System Test
include_recipe '7-Iron::system'             # 7-Iron System Test
include_recipe 'git'                        # 7-Iron Git Test
include_recipe 'apache2'                    # 7-Iron Apache Test
include_recipe 'apache2::mod_rewrite'       # 7-Iron Apache Test
include_recipe 'apache2::mod_ssl'           # 7-Iron Apache Test
include_recipe '7-Iron::apache'             # 7-Iron Apache Test
include_recipe 'php'                        # 7-Iron Apache Test
include_recipe 'apache2::mod_php5'          # 7-Iron PHP Test
include_recipe '7-Iron::php'                # 7-Iron PHP Test
include_recipe '7-Iron::sites'              # 7-Iron Sites Test
include_recipe 'ruby'                       # 7-Iron Ruby and GEMS Test
include_recipe 'gem_installer'              # 7-Iron Ruby and GEMS Test
include_recipe 'composer'                   # 7-Iron Composer Test
include_recipe '7-Iron::composer'           # 7-Iron Composer Test
include_recipe '7-Iron::logs'               # 7-Iron Logs Test
include_recipe 'mysql::server'              # 7-Iron MYSQL Test
include_recipe '7-Iron::mailcatcher'        # 7-Iron Mailcatcher Test
include_recipe '7-Iron::drush_modules'      # 7-Iron Drush Modules Test
include_recipe 'xdebug'                     # 7-Iron Xdebug Test
include_recipe '7-Iron::xhprof'             # 7-Iron Xhprof Test
~~~

Note:

1. The comment by each recipe identifies the test which covers it.
2. Recipes run **in the order they are listed**.
3. Recipes with the prefix `7-Iron::` are recipes provided specifically by the
   7-Iron cookbook.
4. Cookbook recipes **must be added to this list in order to run**.
5. When possible, do not call recipes from other wrapper type recipes.
    - Instead call library type recipes in the run list and change attribute
    settings for customization.
#>
=end

include_recipe 'apt'                        # 7-Iron System Test
include_recipe 'build-essential'            # 7-Iron System Test
include_recipe 'curl'                       # 7-Iron System Test
include_recipe '7-Iron::system'             # 7-Iron System Test
include_recipe 'git'                        # 7-Iron Git Test
include_recipe 'apache2'                    # 7-Iron Apache Test
include_recipe 'apache2::mod_rewrite'       # 7-Iron Apache Test
include_recipe 'apache2::mod_ssl'           # 7-Iron Apache Test
include_recipe '7-Iron::apache'             # 7-Iron Apache Test
include_recipe 'php'                        # 7-Iron Apache Test
include_recipe 'apache2::mod_php5'          # 7-Iron PHP Test
include_recipe '7-Iron::php'                # 7-Iron PHP Test
include_recipe '7-Iron::sites'              # 7-Iron Sites Test
include_recipe 'ruby'                       # 7-Iron Ruby and GEMS Test
include_recipe 'gem_installer'              # 7-Iron Ruby and GEMS Test
include_recipe 'composer'                   # 7-Iron Composer Test
include_recipe '7-Iron::composer'           # 7-Iron Composer Test
include_recipe '7-Iron::logs'               # 7-Iron Logs Test
include_recipe 'mysql::server'              # 7-Iron MYSQL Test
include_recipe '7-Iron::mailcatcher'        # 7-Iron Mailcatcher Test
include_recipe '7-Iron::drush_modules'      # 7-Iron Drush Modules Test
include_recipe 'xdebug'                     # 7-Iron Xdebug Test
include_recipe '7-Iron::xhprof'             # 7-Iron Xhprof Test
