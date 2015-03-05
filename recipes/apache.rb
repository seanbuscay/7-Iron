# Cookbook Name:: 7-Iron
# Recipe:: apache
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
Configure Apache with mod_rewrite and ssl support, after Apache install.

- Run after apache2 cookbook recipes.
- Generate a selfsigned ssl certificate with snake oil.
- Add vagrant user to the www-data group.
#>
=end

# Generate selfsigned ssl
execute 'make-ssl-cert' do
  command 'make-ssl-cert generate-default-snakeoil --force-overwrite'
  ignore_failure true
  action :nothing
end

group 'www-data' do
  action :modify
  members 'vagrant'
  append true
end

service 'apache2' do
  supports restart: true, reload: true
  action :enable
end
