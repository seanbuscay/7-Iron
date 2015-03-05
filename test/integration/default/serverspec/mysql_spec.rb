# 7-Iron MYSQL Test
# Verify MYSQL is installed and meets requirements.
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

describe '7-Iron Mysql Test' do

  describe 'Verify the correct version is installed, running and listening:' do
    describe service('mysql') do
      it { should be_enabled }
      it { should be_running }
    end
    describe command('apt-cache show mysql-server | grep Version') do
        its(:stdout) { should match /Version: 5.5.4/ }
    end
    describe port(3306) do
      it { should be_listening }
    end
  end

  describe 'Verify the root user can connect to MYSQL:' do
    describe command("mysql -u root -proot -e 'show databases;'") do
      its(:exit_status) { should eq 0 }
    end
  end

end
