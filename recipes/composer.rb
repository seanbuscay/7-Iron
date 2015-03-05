# Cookbook Name:: 7-Iron
# Recipe:: composer
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
Configure Composer for the Vagrant user after install.

- Run composer.json
- Set path variables
- Run after composer cookbook recipe
- Uses the cookbook file `composer.json` which contains: <pre>
"require": {
  "drush/drush": "6.*",
  "behat/behat": "~3.0.6",
  "behat/mink": "~1.6",
  "behat/mink-extension": "*",
  "behat/mink-goutte-driver": "*",
  "phpunit/phpunit": "4.4.*",
  "squizlabs/php_codesniffer": "2.*",
  "phpspec/phpspec": "~2.0"
}</pre>
#>
=end

directory '/home/vagrant/.composer' do
  action :create
end

cookbook_file 'composer.json' do
  path '/home/vagrant/.composer/composer.json'
  action :create
end

execute 'Run composer Install' do
  cwd '/home/vagrant/.composer/'
  command 'composer install'
  not_if { File.exist?('/home/vagrant/.composer/composer.lock') }
  action :run
end

execute 'Run composer update' do
  cwd '/home/vagrant/.composer/'
  command 'composer update'
  only_if { File.exist?('/home/vagrant/.composer/composer.lock') }
  action :run
end

bash_profile 'composer.addin' do
  user 'vagrant'
  content 'PATH="$HOME/.composer/vendor/bin:$PATH"'
end

file '/etc/profile.d/composer.addin' do
  owner 'root'
  group 'root'
  mode '0755'
  content 'PATH="/home/vagrant/.composer/vendor/bin:$PATH"'
  action :create
end
