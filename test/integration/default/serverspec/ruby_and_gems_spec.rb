# 7-Iron Ruby and GEMS Test
# Verify Ruby and GEMS are installed and ready to use.
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

describe '7-Iron RVM and GEMS Test' do
  describe 'Verify Ruby is installed and it is the correct version:' do
    describe command('su -p vagrant  bash -l -c "ruby --version" vagrant') do
      its(:stdout) { should match /1.9.3/ }
    end
  end

  describe 'Verify the correct gems and versions are installed:' do
    describe command('su -p vagrant  bash -l -c "gem list" vagrant') do
      its(:stdout) { should include 'zen-grids (1.4)' }
      its(:stdout) { should include 'bundler (1.8' }
      its(:stdout) { should include 'sass (3.4' }
      its(:stdout) { should include 'compass (1.0' }
      its(:stdout) { should include 'jekyll (2.5' }
      its(:stdout) { should include 'serverspec (2.10' }
      its(:stdout) { should include 'mailcatcher (0.6.1' }
    end
  end

  describe 'Verify the vagrant user can execute a Ruby gem:' do
    describe command('su -p vagrant  bash -l -c "compass --version" vagrant') do
      its(:stdout) { should match /1.0./ }
    end
  end
end
