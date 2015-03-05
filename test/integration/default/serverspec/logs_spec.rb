# 7-Iron Logs Test
# Verify the log reader is present at the correct URL.
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

describe '7-Iron Logs Test' do
  describe 'Verify the log reader site is present:' do
    describe command('lynx -dump -head http://7-Iron.start/logs/index.php') do
      its(:stdout) { should include '200 OK' }
    end
  end
end
