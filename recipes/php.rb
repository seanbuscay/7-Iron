# Cookbook Name:: 7-Iron
# Recipe:: php
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
Configure PHP with suport for Drupal development, after PHP install.

- Install additonal PHP packages
- Install pear Console_Table
- Runs after the php cookbook
- Uses the cookbook templates:
    - `php.ini.erb`
    - `php_cli.ini.erb`
- Uses the cookbook file `files/default/info.php` which contains `phpinfo();`
#>
=end

pkgs = node['7-Iron']['php_packages']

pkgs.each do |pkg|
  package pkg do
    action :install
  end
end

# Prep for Drush which needs this package.
php_pear 'Console_Table' do
  action :install
end

template '/etc/php5/apache2/conf.d/si_php.ini' do
  source 'php.ini.erb'
  mode '0644'
  notifies :restart, 'service[apache2]', :delayed
end

template '/etc/php5/cli/conf.d/si_php_cli.ini' do
  source 'php_cli.ini.erb'
  mode '0644'
end

cookbook_file 'info.php' do
  path '/var/www/html/info.php'
  action :create
end

# NOTE: This is a hack to allow pear to install xdebug correctly.
# It created the conf.d directory which xdebug tried to add a config to.
directory '/etc/php5/conf.d/' do
  owner 'root'
  group 'root'
  mode '0755'
  action :create
end
