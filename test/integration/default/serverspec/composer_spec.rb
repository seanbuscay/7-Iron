# 7-Iron Composer Test
# Verify Composer is installed and meets requirements.
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

describe '7-Iron Composer Test' do

  describe 'Verify Composer is installed and executable by vagrant user:' do
    describe file('/usr/local/sbin/composer') do
      it { should be_file }
      it { should be_executable }
      it { should be_executable.by_user('vagrant') }
    end
  end

  describe "Verify Composer's installed package list:" do
    describe command('cd /home/vagrant/.composer; composer show --installed')  do
      its(:stdout) { should include 'drush' }
      its(:stdout) { should include 'behat' }
      its(:stdout) { should include 'mink' }
      its(:stdout) { should include 'mink-extension' }
      its(:stdout) { should include 'mink-goutte-driver' }
      its(:stdout) { should include 'phpspec' }
      its(:stdout) { should include 'phpunit' }
      its(:stdout) { should include 'php_codesniffer' }

    end
  end

  describe 'Verify installed package versions:' do
    # This is an expensive test and is somewhat redundant.
    # However, we still want to verify the vagrant user can execute these
    # packages without error.
    describe command('su -p vagrant  bash -l -c "drush --version" vagrant') do
      its(:stdout) { should match /6./ }
    end
    describe command('su -p vagrant  bash -l -c "phpunit --version" vagrant') do
      its(:stdout) { should match /4./ }
    end
    describe command('su -p vagrant  bash -l -c "behat --version" vagrant') do
      its(:stdout) { should match /3./ }
    end
    describe command('su -p vagrant bash -l -c "phpspec --version" vagrant') do
      its(:stdout) { should match /2./ }
    end
    describe command('su -p vagrant bash -l -c "phpcs --version" vagrant') do
      its(:stdout) { should match /2./ }
    end
  end

end
