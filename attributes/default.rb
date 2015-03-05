# Cookbook Name:: 7-Iron
# This file contains most of the defaults settings for the cookbook.
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

#<
# Mysql root user password.
#     - See: https://github.com/opscode-cookbooks/mysql#attributes
#     - Set mysql server defaults using the same format.
#     - **Do not deploy a public mysql server with root as the default password.**
#>
default['mysql']['server_root_password'] = 'root'
#<
# Apache user name
#     - See: https://github.com/onehealth-cookbooks/apache2#attributes
#     - Set apache server defaults using the same format.
#>
default['apache']['user'] = 'vagrant'
#<
# Apache user group
#     - See: https://github.com/onehealth-cookbooks/apache2#attributes
#     - Set apache server defaults using the same format.
#>
default['apache']['group'] = 'vagrant'
#<
#  Location for docroot.
#     - Set to work with Ubuntu's change to using a docroot at /var/www/html
#>
default['apache']['docroot_dir'] = '/var/www/html'
#<
#  Setting to enable or disable a default site for Apache
#     - See: https://github.com/onehealth-cookbooks/apache2#attributes
#>
default['apache']['default_site_enabled'] = true
#<
#  Setting to install composer globally.
#     - See: https://github.com/escapestudios-cookbooks/composer#attributes
#     - See: https://getcomposer.org/doc/00-intro.md#globally
#>
default['composer']['install_globally'] = true
#<
#  Change location because Kitchen creates a symlink on /usr/local/bin/composer
#     - See: https://github.com/escapestudios-cookbooks/composer#attributes
#     - See: https://getcomposer.org/doc/00-intro.md#globally
#>
default['composer']['install_dir'] = '/usr/local/sbin'
#<
#  Set build essentials to install at compile time
#     - Early incase other recipes need it.
#>
default['build_essential']['compile_time'] = true
#<
#  Xdebug config file
#     - See: https://community.opscode.com/cookbooks/xdebug
#>
default['xdebug']['config_file'] = '/etc/php5/apache2/conf.d/xdebug.ini'
#<
#  Xdebug directives
#     - See: https://community.opscode.com/cookbooks/xdebug
#     - Set xdebug defaults using the same format.
#     - Defaults to <pre>{
#     'remote_enable' => 1,
#     'remote_connect_back' => 1,
#     'remote_port' => 9000,
#     'remote_handler' => 'dbgp',
#     'profiler_enable' => 0,
#     'profiler_enable_trigger' => 1,
#     'show_exception_trace' => 0
# }</pre>
#>
default['xdebug']['directives'] =  {
  'remote_enable' => 1,
  'remote_connect_back' => 1,
  'remote_port' => 9000,
  'remote_handler' => 'dbgp',
  'profiler_enable' => 0,
  'profiler_enable_trigger' => 1,
  'show_exception_trace' => 0
}
#<
#  A hash of PHP Packes to install.
#     - Used by the 7-Iron PHP recipe.
#     - Edit to add or remove packages before build or converge.
#     - Defaults to <pre>[
#     'php5-gd',
#     'php5-mysql',
#     'php5-curl',
#     'php5-json',
#     'php5-xsl',
#     'php5-mcrypt'
# ]</pre>
#>
default['7-Iron']['php_packages'] = [
  'php5-gd',
  'php5-mysql',
  'php5-curl',
  'php5-json',
  'php5-xsl',
  'php5-mcrypt'
]
#<
#  A hash of Linux Packes to install.
#     - Used by the 7-Iron System recipe.
#     - Edit to add or remove packages before build or converge.
#     - Defaults to <pre>[
#     'wget',
#     'lynx',
#     'rsync',
#     'nfs-common',
#     'nodejs',
#     'libsqlite3-dev'
# ]</pre>
#>
default['7-Iron']['system_packages'] = [
  'wget',
  'lynx',
  'rsync',
  'nfs-common',
  'nodejs',
  'libsqlite3-dev'
]
#<
#  A hash of gems to install.  Replace nil with a version string as needed.
#     - See: https://supermarket.chef.io/cookbooks/gem_installer#readme
#     - Defaults to <pre>{
#     'bundler' => nil,
#     'sass' => nil,
#     'compass' => nil,
#     'zen-grids' => nil,
#     'jekyll' => nil,
#     'serverspec' => nil,
#     'mailcatcher' => '0.6.1'
# }</pre>
#>
default['gem_installer']['gems'] = {
  'bundler' => nil,
  'sass' => nil,
  'compass' => nil,
  'zen-grids' => nil,
  'jekyll' => nil,
  'serverspec' => nil,
  'mailcatcher' => '0.6.1'
}
