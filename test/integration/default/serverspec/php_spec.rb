# 7-Iron PHP Test
# Verify PHP is installed and meets requirements.
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

describe '7-Iron PHP Test' do
  describe 'Verify PHP is installed with the correct version:' do
    context 'from the cli -' do
      describe command('php -v') do
        its(:stdout) { should match /PHP 5.5.9/ }
      end
    end
    context 'from Apache -' do
      describe command('lynx -dump -dont_wrap_pre http://localhost/info.php') do
        its(:stdout) { should include 'PHP Version 5.5.9' }
      end
    end
  end

  describe 'Verify PHP is configured correctly:' do
    context 'from the cli -' do
      describe php_config('allow_url_fopen') do
        its(:value) { should eq 1 }
      end
      describe php_config('memory_limit') do
        its(:value) { should eq '512M' }
      end
      describe php_config('error_reporting') do
        # Test for the error reporting constant.
        # BACKLOG: Troubleshoot why constant is different between cli & apache.
        # Use http://www.bx.com.au/tools/ultimate-php-error-reporting-wizard
        its(:value) { should eq 32767 }
      end
    end
    context 'from Apache -' do
      describe command('lynx -dump -dont_wrap_pre http://localhost/info.php') do
        its(:stdout) { should include 'allow_url_fopen On On' }
        its(:stdout) { should include 'error_reporting 32767 32767' }
        its(:stdout) { should include 'memory_limit 512M 512M' }
        its(:stdout) { should include 'ctype functions enabled' }
        its(:stdout) { should include 'PDO support enabled' }
        its(:stdout) { should include 'PDO drivers mysql' }
        its(:stdout) { should include 'GD Support         enabled' }
        its(:stdout) { should include 'json support             enabled' }
        its(:stdout) { should include 'MysqlI Support                 enabled' }
        its(:stdout) { should include 'Simplexml support                     enabled' }
        its(:stdout) { should include 'Tokenizer Support enabled' }
        its(:stdout) { should include 'XML Support           active' }
      end
    end
  end

  describe 'Verify the correct PHP packages are installed' do
    describe 'libapache2-mod-php5filter package has a bug which breaks Drupal.
    Use libapache2-mod-php5 instead.' do
      describe package('libapache2-mod-php5') do
        it { should be_installed }
      end
    end
    describe package('php5') do
      it { should be_installed }
    end
    describe package('php5-gd') do
      it { should be_installed }
    end
    describe package('php5-mysql') do
      it { should be_installed }
    end
    describe package('php5-curl') do
      it { should be_installed }
    end
    describe package('php5-json') do
      it { should be_installed }
    end
    describe package('php5-xsl') do
      it { should be_installed }
    end
    describe package('php5-mcrypt') do
      it { should be_installed }
    end
  end

end
