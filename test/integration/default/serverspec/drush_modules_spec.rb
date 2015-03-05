# 7-Iron Drush Modules Test
# Verify the Drush modules are properly installed.
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

describe '7-Iron Drush Modules Test' do
  describe 'Verify Modules Installed:' do
    describe command('su -p vagrant  bash -l -c "drush" vagrant') do
      its(:stdout) { should include '(coder,coder_review,drupalcs,make,registry_rebuild)' }
    end
  end
  describe 'Verify Drush version' do
    describe command('su -p vagrant  bash -l -c "drush --version" vagrant') do
      its(:stdout) { should match /6./ }
    end
  end
end
