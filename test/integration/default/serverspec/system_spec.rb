# 7-Iron System Test
# Verify various system components are installed and meet requirements.
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

describe '7-Iron System Test' do

  describe 'Verify the correct version of Linux is installed:' do
    describe command('uname') do
      its(:stdout) { should start_with 'Linux' }
    end
    describe command('uname -r') do
      its(:stdout) { should start_with '3.13.0-24-generic' }
    end
    describe file('/etc/lsb-release') do
      its(:content) { should match /DISTRIB_ID=Ubuntu/ }
      its(:content) { should match /DISTRIB_RELEASE=14.04/ }
    end
  end

  describe 'Verify the correct packages are installed:' do
    # Test apt recipe.
    describe package('update-notifier-common') do
      it { should be_installed }
    end
    # Tests build essential.
    # Ensure GCC exists
    describe command('gcc --version') do
      its(:exit_status) { should eq 0 }
    end
    # Ensure GNU Make exists
    describe command('make --version') do
      its(:exit_status) { should eq 0 }
      its(:stdout) { should match /GNU/ }
    end
    # Test NFS.
    describe package('nfs-common') do
      it { should be_installed }
    end
    # Test Curl recipe.
    describe package('curl') do
      it { should be_installed }
    end
    describe package('wget') do
      it { should be_installed }
    end
    describe package('lynx') do
      it { should be_installed }
    end
    describe package('rsync') do
      it { should be_installed }
    end
    # Jekyll started wanting this.
    describe package('nodejs') do
      it { should be_installed }
    end
    # Mailcatcher needs it.
    describe package('libsqlite3-dev') do
      it { should be_installed }
    end
  end

  describe 'Verify directories and permissions:' do
    # As a block now, because we may add more system directory checks.
    describe file('/home/vagrant/logs') do
      it { should be_owned_by 'vagrant' }
      it { should be_grouped_into 'vagrant' }
      it { should be_readable.by('owner') }
      it { should be_readable.by('group') }
      it { should be_writable.by('owner') }
    end
  end

end
