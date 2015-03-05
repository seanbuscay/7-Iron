# 7-Iron Apache Test
# Verify Apache is installed and meets requirements.
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

require 'serverspec'
require 'spec_helper'

set :backend, :exec

describe '7-Iron Apache Test' do
  describe 'Verify the correct version is installed, running and listening:' do
    describe package('apache2') do
      it { should be_installed }
    end
    describe service('apache2') do
      it { should be_enabled }
      it { should be_running }
    end
    describe port(80) do
      it { should be_listening }
    end
    describe command('apache2 -v') do
      its(:stdout) { should match /Server version: Apache\/2.4.7/ }
    end
  end

  describe 'Verify logs & directories are accessible & readable
  by the vagrant user:' do
    describe file('/var/log/apache2') do
      it { should be_directory }
      it { should be_readable.by_user('vagrant') }
    end
    describe file('/var/www/html') do
      it { should be_directory }
      it { should be_readable.by_user('vagrant') }
    end
  end

  describe 'Verify the vagrant & www-data users exist in the right groups:' do
    describe user('vagrant') do
      it { should exist }
      it { should belong_to_group 'vagrant' }
      it { should belong_to_group 'www-data' }
    end
    describe user('www-data') do
      it { should exist }
      it { should belong_to_group 'www-data' }
    end
  end

  describe 'Verify the required modules are installed:' do
    describe command('lynx -dump -dont_wrap_pre http://localhost/info.php') do
      its(:stdout) { should include 'mod_rewrite' }
    end
  end
end
