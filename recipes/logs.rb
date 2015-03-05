# Cookbook Name:: 7-Iron
# Recipe:: logs
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
Install and configure the "PimpMyLog" app to read Apache amd PHP logs.

- Uses the cookbook file: `logs.conf.php`
#>
=end

git '/var/www/html/logs' do
  repository 'git://github.com/potsky/PimpMyLog.git'
  revision 'master'
  action :sync
end

cookbook_file 'logs.conf.php' do
  path '/var/www/html/logs/config.user.php'
  action :create
end
