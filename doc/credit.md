# Usage

Below are a few ways to use the 7-Iron Cookbook if you don't want to use the pre-built 7-Iron Server.

## Add 7-Iron to your own cookbook

1. In the `metadata.rb` of your cookbook declare a dependency on the 7-Iron Cookbook and any framework cookbook the application may need.  Add the line below:

    ```
    depends '7-Iron'
    ```

2. Add a copy of the 7-Iron Cookbook to your cookbooks path, or if you use Berkshelf (recommended) then add the following entry to your Berksfile.

    ```
    cookbook '7-Iron', git: 'git://github.com/seanbuscay/7-Iron.git'
    ```

3. Add the the 7-Iron default recipe to your run list (or just the recipes you want to use).

    ```
    include_recipe '7-Iron::default'
    ```

4.  Override any attributes found in 7-Iron's `attributes/default.rb` file using your own attributes file.

## Add 7-Iron to the run list in a Vagrantfile

```
Vagrant.configure("2") do |config|
  config.vm.provision "chef_solo" do |chef|
    chef.add_recipe "7-Iron"
  end
end
```

See: http://docs.vagrantup.com/v2/provisioning/chef_solo.html for further details and configuration options.

## Add 7-Iron to your Chef Server

**A.** Download and extract the 7-Iron Cookbook to your chef-repo/cookbooks directory

_OR_ (If you have Berkshelf installed.)

**B.** Download and extract 7-Iron to a local directory and run `berks vendor path_to_output` .  This will download 7-Iron and all its dependent cookbooks to your output path.  Then put the output into your chef-repo/cookbooks directory.

1. Upload 7-Iron to your chef-server using `knife cookbook upload -a`
2. Run the chef-client on your client node using chef-client

See: https://www.digitalocean.com/community/tutorials/how-to-create-simple-chef-cookbooks-to-manage-infrastructure-on-ubuntu for further detail.

# Thanks

Most of this code is modeled after or directly re-used from a number of sources all over the net.

Thank you to all who share their recipes, code, and knowledge on the web.

I especially want to thank and acknowledge these projects and sources:

- [Vagrant Drupal Development](https://www.drupal.org/project/vdd)
    - This project was my source cookbook for many previous Chef vagrant projects.
    - VDD is a great contribution for the Drupal community from Dmytro Danylevskyi, Eric DenBraber, and [all](https://www.drupal.org/node/2008018/committers).
- [Vlad - Vagrant LAMP Ansible Drupal](https://github.com/hashbangcode/vlad)
    - A best in class Vagrant development environment for Drupal projects.
    - With really [helpful documentation](http://vlad-docs.readthedocs.org/en/latest/).
- [The Official Unofficial Getting Started with ChefDK Guide](http://tcotav.github.io/chefdk_getting_started.html) by James Francis
    - Thank you James for demystifying the fairly undocumented development workflow with ChefDK.
- [Chef Development Kit](https://github.com/chef/chef-dk) and its bundled tools
    - Chef
    - Berkshelf
        - You make cookbook management so much easier!
    - Test Kitchen
        - Thank you for `kitchen converge` !!!
    - Foodcritic
- [Serverspec](http://serverspec.org/)
    - TDD-based server development saves me sooo much time.

# License
<pre>
Copyright 2015 Sean P. Buscay

 Licensed under the Apache License, Version 2.0 (the "License");
 you may not use this file except in compliance with the License.
 You may obtain a copy of the License at

     http://www.apache.org/licenses/LICENSE-2.0

 Unless required by applicable law or agreed to in writing, software
 distributed under the License is distributed on an "AS IS" BASIS,
 WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
 See the License for the specific language governing permissions and
 limitations under the License.
 </pre>
