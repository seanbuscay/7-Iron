# Cookbook Name:: 7-Iron
# Recipe:: xhprof
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
Install and configure xhprof.

- Install pear xhprof
- Install graphviz
- Uses the cookbook templates
    - `xhprof.ini.erb`
    - `xhprof.conf.erb`
#>
=end

php_pear 'xhprof' do
  preferred_state 'beta'
  action :install
end

package 'graphviz' do
    action :install
end

template '/etc/apache2/conf-enabled/xhprof.conf' do
  source 'xhprof.conf.erb'
  mode '0644'
  notifies :restart, 'service[apache2]', :delayed
end

template '/etc/php5/apache2/conf.d/xhprof.ini' do
  source 'xhprof.ini.erb'
  mode '0644'
  notifies :restart, 'service[apache2]', :delayed
end

directory '/home/vagrant/logs/xhprof_output_dir' do
  owner 'vagrant'
  group 'vagrant'
  mode '0777'
  action :create
end
