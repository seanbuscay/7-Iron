# 7-Iron Git Test
# Verify Git is installed with the correct version. 
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

describe '7-Iron Git Test' do
  describe 'Verify GIT is installed with the correct version:' do
    describe package('git') do
      it { should be_installed }
    end
    describe command('git --version') do
      its(:stdout) { should match /1.9./ }
    end
  end
end
