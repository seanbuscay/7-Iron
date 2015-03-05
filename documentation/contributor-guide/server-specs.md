<h1>Server Specs</h1>

## Introduction

We develop our cookbook based on feature requests and specifications provided by end-users.

Each feature, may be expressed as testable specifications.  

As shown in the recipe run list, each recipe is covered by an automated test.  

Right now, all tests are written in [ServerSpec](http://serverspec.org/), which works well for us because our application cookbook builds a server.

## Test Examples

Below are two examples of how a feature specification may be expressed in a test.

**Server should have Drush**

Let's look at "should have Drush".  

We know we want Drush installed, and it should probably be a known version, and when logged in, the user should be able to use it without errors.  

The test code below verifies Drush:

1. is installed on the server
2. has version 6
3. and is executable by the vagrant user without error

```ruby
describe 'Verify Drush version' do
  describe command('su -p vagrant  bash -l -c "drush --version" vagrant') do
    its(:stdout) { should match /6./ }
  end
end
```

Note: This test would fail if there were no drush present, if the version did not match, or if the command returned any error.

**Apache should be installed and working**

We know we want Apache installed and working as a web server.  We expect the Apache version to be relatively new.

The code block below describes in a test the desired scenario.

~~~ruby
describe 'Verify the correct version is installed, running and listening:' do
  describe package('apache2') do
    it { should be_installed }
  end
  describe service('apache2') do
    it { should be_enabled }
    it { should be_running }
  end
  describe port(80) do
    it { should be_listening }
  end
  describe command('apache2 -v') do
    its(:stdout) { should match /Server version: Apache\/2.4.7/ }
  end
end
~~~

These docs contain the raw output from a recent test run against the provisioned server.

The results are useful:

1. To know everything is working as expected
2. As a document which defines our server's specifications, right down to version numbers when they are important.
