# Cookbook Name:: 7-Iron
# Recipe:: drush_modules
#
# BACKLOG: http://cgit.drupalcode.org/coder/tree/coder_sniffer/README.txt?id=7.x-2.4
# FIX: Drush dl
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
Install drush modules.

- coder-7.x-2.4
- registry_rebuild
#>
=end

directory '/home/vagrant/.drush' do
  owner 'vagrant'
  group 'vagrant'
  mode '0755'
  action :create
end
# TODO: Add a file or command check with an if statement.
bash 'install coder module' do
  user 'vagrant'
  cwd '/home/vagrant/.drush'
  environment 'HOME' => '/home/vagrant'
  code <<-EOH
  source /home/vagrant/.bash_profile
  source /home/vagrant/.bashrc
  drush dl -y coder-7.x-2.4
  drush dl -y registry_rebuild
  drush cc drush
  EOH
end
