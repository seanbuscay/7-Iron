# 7-Iron Test Sites
# Verify the dev site and the control panel site are present.
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

describe '7-Iron Test Sites' do
  describe 'Verify the sites are present at the correct urls:' do
    context '.dev url' do
      describe command('lynx -dump -head http://7-Iron.dev/') do
        its(:stdout) { should include '200 OK' }
      end
      describe command('lynx -dump -dont_wrap_pre http://7-Iron.dev') do
        its(:stdout) { should include 'Welcome to the 7-Iron Site' }
      end
    end
    context '.start url' do
      describe command('lynx -dump -head http://7-Iron.start') do
        its(:stdout) { should include '200 OK' }
      end
      describe command('lynx -dump -dont_wrap_pre http://7-Iron.start') do
        its(:stdout) { should include '7-Iron Server - Getting Started' }
      end
    end
    context '/dev alias' do
      describe command('lynx -dump -dont_wrap_pre http://localhost/dev') do
        its(:stdout) { should include 'Welcome to the 7-Iron Site' }
      end
    end
    context '/start alias' do
      describe command('lynx -dump -dont_wrap_pre http://localhost/') do
        its(:stdout) { should include '7-Iron Server - Getting Started' }
      end
    end
  end
end
