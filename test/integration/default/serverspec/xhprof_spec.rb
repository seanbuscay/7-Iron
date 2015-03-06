# 7-Iron Xhprof Test
# Verify Xhprof is installed and ready to use.
#
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

describe '7-Iron Xhprof Test' do

  describe file('/home/vagrant/logs/xhprof_output_dir') do
    it { should be_owned_by 'vagrant' }
    it { should be_grouped_into 'vagrant' }
    it { should be_readable.by('owner') }
    it { should be_readable.by('group') }
    it { should be_writable.by('owner') }
    it { should be_writable.by('group') }
    it { should be_writable.by_user('vagrant') }
  end

  context 'from Apache -' do
    describe command('lynx -dump -dont_wrap_pre http://localhost/info.php') do
      its(:stdout) { should include 'xhprof  0.9.2' }
    end
  end

  context 'URL is present and reachable -' do
    describe command('lynx -dump -dont_wrap_pre http://7-Iron.dev/xhprof_html') do
        its(:stdout) { should include 'No XHProf runs specified in the URL.' }
      end
  end

end
