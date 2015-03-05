# Cookbook Name:: 7-Iron
# Recipe:: mailcatcher
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
Configure PHP to use mailcatcher to capture & read emails during development.

- Add a bash profile entry to start mailcatcher on every login
- Uses the cookbook template `mailcatcher.ini.erb`
- Uses the cookbook files `email_test.php` which let's us test email sent from
  mail function.
#>
=end

template '/etc/php5/apache2/conf.d/mailcatcher.ini' do
  source 'mailcatcher.ini.erb'
  mode '0644'
  notifies :restart, 'service[apache2]', :delayed
end

template '/etc/php5/cli/conf.d/mailcatcher.ini' do
  source 'mailcatcher.ini.erb'
  mode '0644'
end

bash 'set mailcacther ip table rules' do
  user 'root'
  code <<-EOH
  iptables -I INPUT 1 -p tcp --dport 1080 -j ACCEPT -m comment --comment "mailcatcherweb"
  EOH
end
# This is probably not needed at this point during install. It doesn't hurt to leace it.
bash 'kill any previously running mailcatcher processes' do
  user 'root'
  ignore_failure true
  code <<-EOH
  killall -9 mailcatcher
  EOH
end

bash_profile 'mailcatcher.addin' do
  user 'vagrant'
  content 'mailcatcher --ip=0.0.0.0 >/dev/null 2>/dev/null'
end

bash 'source paths' do
  user 'vagrant'
  environment 'HOME' => '/home/vagrant'
  code <<-EOH
  source /home/vagrant/.bash_profile
  source /home/vagrant/.bashrc
  EOH
end

cookbook_file 'email_test.php' do
  path '/var/www/html/email_test.php'
  action :create
end
