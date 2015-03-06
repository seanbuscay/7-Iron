# Cookbook Name:: 7-Iron
# Recipe:: website
#
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
Set up doc root, host file entries, and Vhost configs for the 7-Iron application sites.

- Add sites:
    - 7-Iron.dev The url for the site being developed.
    - 7-Iron.start The url for the 7-Iron start page.
- Uses the hostsfile cookbook.
- Uses the cookbook files:
    - `index.start.html`
    - `index.dev.html`
- Uses the template: `site_aliases.conf.erb`
#>
=end

directory '/home/vagrant/workspace' do
  owner 'vagrant'
  group 'vagrant'
  mode '0766'
  action :create
end
directory '/home/vagrant/workspace/docroot' do
  owner 'vagrant'
  group 'vagrant'
  mode '0766'
  action :create
end

web_app 'dev' do
  server_name '7-Iron.dev'
  server_aliases ['www.7-Iron.dev']
  docroot '/home/vagrant/workspace/docroot'
  cookbook 'apache2'
  allow_override 'All'
end

cookbook_file 'index.dev.html' do
  path '/home/vagrant/workspace/docroot/index.html'
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end

link '/var/www/html/dev' do
  to '/home/vagrant/workspace/docroot'
end

web_app 'start' do
  server_name '7-Iron.start'
  server_aliases ['www.7-Iron.start']
  docroot '/var/www/html'
  cookbook 'apache2'
  allow_override 'All'
end

remote_directory '/var/www/html' do
  source 'start_docs'
  action :create
end

hostsfile_entry '127.0.0.1' do
  hostname '7-Iron'
  aliases ['7-Iron.start', 'www.7-Iron.start', '7-Iron.dev', 'www.7-Iron.dev']
  comment 'Append by 7-Iron Sites Recipe'
  action :append
end

template '/etc/apache2/conf-enabled/allow_overrides.conf' do
  source 'allow_overrides.conf.erb'
  mode '0644'
  notifies :restart, 'service[apache2]', :delayed
end
