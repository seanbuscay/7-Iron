# 7-Iron Mailcatcher Test
# Verify emails are caught and readable by mailcatcher.
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

describe '7-Iron Mailcatcher Test' do
  describe 'PHP' do
    check_mail = <<-cmd
    lynx -dump -dont_wrap_pre http://7-Iron.start:1080/messages
    cmd
    context 'from php cli' do
      cli_unique_id = Time.now.to_i.to_s
      php_cli_cmd = <<-cmd
php -r "mail('cli.#{cli_unique_id}@7-Iron', 'Test from Cli #{cli_unique_id}', 'Sent via PHP Command Line');"
      cmd
      describe command(php_cli_cmd), sudo: false do
        its(:exit_status) { should eq 0 }
      end
      describe command(check_mail) do
        its(:stdout)  { should include cli_unique_id }
      end
    end
    context 'from a web page' do
      php_unique_id = Time.now.to_i.to_s
      php_cmd = <<-cmd
lynx -dump -dont_wrap_pre http://7-Iron.start/email_test.php?uid=#{php_unique_id}
      cmd
      describe command(php_cmd) do
        its(:stdout) { should include 'Success' }
      end
      describe command(check_mail) do
        its(:stdout)  { should include php_unique_id }
      end
    end
  end
end
