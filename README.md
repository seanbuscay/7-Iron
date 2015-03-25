# 7-Iron Server

*Your "Go-to" Vagrant Box for PHP and Drupal Development*

7-Iron is:

1. A LAMP Server in a Vagrant Box for PHP and Drupal developers
2. A Chef Cookbook and Packer template to build your own custom LAMP server
3. Covered by over 100 automated tests to ensure your system will work as expected

## For 7-Iron Vagrant Box Users

**You do not need to clone or build anything from the 7-Iron repository.**

[Simply download the latest 7-Iron Vagrantfile](https://github.com/seanbuscay/7-Iron/releases/download/v0.0.2/Vagrantfile) to the directory where you want to run the 7-Iron Vagrant Box.

Then run `vagrant up` in the directory you saved the Vagrantfile.

Visit: [User Guide Overview](http://7-iron.github.io/user-guide/) for next steps.

and here
## For 7-Iron Cookbook Users

This README provides detailed documentation about the 7-Iron Cookbook, including its [Attributes](#attributes), [Recipes](#recipes), and [Usage](#usage).

For further documentation visit: [http://7-iron.github.io/](http://7-iron.github.io/)

## For 7-Iron Contributors

Visit: [Contributor Guide Overview](http://7-iron.github.io/contributor-guide/)


# Software Included in 7-Iron

The following software is included with the default 7-Iron build:

- Ubuntu-14.04 Linux
- Apache
- PHP (optmized for Drupal development)
- Git
- Mysql
- Mailcatcher
- Pimp My Log
- Xdebug
- Xhprof
- Graphviz
- Composer
- Drush
    - Coder
    - Registry rebuild
- PHPUnit
- PHP Code Sniffer
- PHPspec
- Behat
- Mink
- Ruby
- Gems
    - Bundler
    - Zen-Grids
    - Sass
    - Compass
    - Jekyll

# Requirements

## Platform:

* Ubuntu (>= 14.04)

## Cookbooks:

* apt (~> 2.5.3)
* build-essential
* apache2 (~> 2.0.0)
* hostsfile (~> 2.4.5)
* git (~> 4.0.2)
* mysql (= 5.5.0)
* composer (~> 1.0.5)
* drush (~> 0.9.0)
* php (~> 1.4.6)
* curl (~> 2.0.0)
* xdebug (~> 1.0.0)
* ruby (~> 0.9.3)
* gem_installer (~> 0.1.2)
* bash (~> 0.1.2)

# Attributes

* `node['mysql']['server_root_password']` - Mysql root user password.
    - See: https://github.com/opscode-cookbooks/mysql#attributes
    - Set mysql server defaults using the same format.
    - **Do not deploy a public mysql server with root as the default password.**.  <li> Defaults to `"root"`
* `node['apache']['user']` - Apache user name
    - See: https://github.com/onehealth-cookbooks/apache2#attributes
    - Set apache server defaults using the same format.  <li> Defaults to `"vagrant"`
* `node['apache']['group']` - Apache user group
    - See: https://github.com/onehealth-cookbooks/apache2#attributes
    - Set apache server defaults using the same format.  <li> Defaults to `"vagrant"`
* `node['apache']['docroot_dir']` - Location for docroot.
    - Set to work with Ubuntu's change to using a docroot at /var/www/html.  <li> Defaults to `"/var/www/html"`
* `node['apache']['default_site_enabled']` - Setting to enable or disable a default site for Apache
    - See: https://github.com/onehealth-cookbooks/apache2#attributes.  <li> Defaults to `"true"`
* `node['composer']['install_globally']` - Setting to install composer globally.
    - See: https://github.com/escapestudios-cookbooks/composer#attributes
    - See: https://getcomposer.org/doc/00-intro.md#globally.  <li> Defaults to `"true"`
* `node['composer']['install_dir']` - Change location because Kitchen creates a symlink on /usr/local/bin/composer
    - See: https://github.com/escapestudios-cookbooks/composer#attributes
    - See: https://getcomposer.org/doc/00-intro.md#globally.  <li> Defaults to `"/usr/local/sbin"`
* `node['build_essential']['compile_time']` - Set build essentials to install at compile time
    - Early incase other recipes need it.  <li> Defaults to `"true"`
* `node['xdebug']['config_file']` - Xdebug config file
    - See: https://community.opscode.com/cookbooks/xdebug.  <li> Defaults to `"/etc/php5/apache2/conf.d/xdebug.ini"`
* `node['xdebug']['directives']` - Xdebug directives
    - See: https://community.opscode.com/cookbooks/xdebug
    - Set xdebug defaults using the same format.
    - Defaults to <pre>{
    'remote_enable' => 1,
    'remote_connect_back' => 1,
    'remote_port' => 9000,
    'remote_handler' => 'dbgp',
    'profiler_enable' => 0,
    'profiler_enable_trigger' => 1,
    'show_exception_trace' => 0
}</pre>.
* `node['7-Iron']['php_packages']` - A hash of PHP Packes to install.
    - Used by the 7-Iron PHP recipe.
    - Edit to add or remove packages before build or converge.
    - Defaults to <pre>[
    'php5-gd',
    'php5-mysql',
    'php5-curl',
    'php5-json',
    'php5-xsl',
    'php5-mcrypt'
]</pre>.
* `node['7-Iron']['system_packages']` - A hash of Linux Packes to install.
    - Used by the 7-Iron System recipe.
    - Edit to add or remove packages before build or converge.
    - Defaults to <pre>[
    'wget',
    'lynx',
    'rsync',
    'nfs-common',
    'nodejs',
    'libsqlite3-dev'
]</pre>.
* `node['gem_installer']['gems']` - A hash of gems to install.  Replace nil with a version string as needed.
    - See: https://supermarket.chef.io/cookbooks/gem_installer#readme
    - Defaults to <pre>{
    'bundler' => nil,
    'sass' => nil,
    'compass' => nil,
    'zen-grids' => nil,
    'jekyll' => nil,
    'serverspec' => nil,
    'mailcatcher' => '0.6.1'
}</pre>.

# Recipes

* [7-Iron::apache](#7-Ironapache) - Configure Apache with mod_rewrite and ssl support, after Apache install.
* [7-Iron::composer](#7-Ironcomposer) - Configure Composer for the Vagrant user after install.
* [7-Iron::default](#7-Irondefault) - Install and configure a LAMP stack for php (Drupal-centric) web development.
* [7-Iron::drush_modules](#7-Irondrush_modules) - Install drush modules.
* [7-Iron::logs](#7-Ironlogs) - Install and configure the "PimpMyLog" app to read Apache amd PHP logs.
* [7-Iron::mailcatcher](#7-Ironmailcatcher) - Configure PHP to use mailcatcher to capture & read emails during development.
* [7-Iron::php](#7-Ironphp) - Configure PHP with suport for Drupal development, after PHP install.
* [7-Iron::sites](#7-Ironsites) - Set up doc root, host file entries, and Vhost configs for the 7-Iron application sites.
* [7-Iron::system](#7-Ironsystem) - Install & configure miscellaneous system components, directories & permissions.
* [7-Iron::xhprof](#7-Ironxhprof) - Install and configure xhprof.

## 7-Iron::apache

Configure Apache with mod_rewrite and ssl support, after Apache install.

- Run after apache2 cookbook recipes.
- Generate a selfsigned ssl certificate with snake oil.
- Add vagrant user to the www-data group.

## 7-Iron::composer

Configure Composer for the Vagrant user after install.

- Run composer.json
- Set path variables
- Run after composer cookbook recipe
- Uses the cookbook file `composer.json` which contains: <pre>
"require": {
  "drush/drush": "6.*",
  "behat/behat": "~3.0.6",
  "behat/mink": "~1.6",
  "behat/mink-extension": "*",
  "behat/mink-goutte-driver": "*",
  "phpunit/phpunit": "4.4.*",
  "squizlabs/php_codesniffer": "2.*",
  "phpspec/phpspec": "~2.0"
}</pre>

## 7-Iron::default

Install and configure a LAMP stack for php (Drupal-centric) web development.

**7-Iron is an application cookbook with one default recipe** to serve as the
application run list.

Here is the default recipe run list:

~~~ruby
include_recipe 'apt'                        # 7-Iron System Test
include_recipe 'build-essential'            # 7-Iron System Test
include_recipe 'curl'                       # 7-Iron System Test
include_recipe '7-Iron::system'             # 7-Iron System Test
include_recipe 'git'                        # 7-Iron Git Test
include_recipe 'apache2'                    # 7-Iron Apache Test
include_recipe 'apache2::mod_rewrite'       # 7-Iron Apache Test
include_recipe 'apache2::mod_ssl'           # 7-Iron Apache Test
include_recipe '7-Iron::apache'             # 7-Iron Apache Test
include_recipe 'php'                        # 7-Iron Apache Test
include_recipe 'apache2::mod_php5'          # 7-Iron PHP Test
include_recipe '7-Iron::php'                # 7-Iron PHP Test
include_recipe '7-Iron::sites'              # 7-Iron Sites Test
include_recipe 'ruby'                       # 7-Iron Ruby and GEMS Test
include_recipe 'gem_installer'              # 7-Iron Ruby and GEMS Test
include_recipe 'composer'                   # 7-Iron Composer Test
include_recipe '7-Iron::composer'           # 7-Iron Composer Test
include_recipe '7-Iron::logs'               # 7-Iron Logs Test
include_recipe 'mysql::server'              # 7-Iron MYSQL Test
include_recipe '7-Iron::mailcatcher'        # 7-Iron Mailcatcher Test
include_recipe '7-Iron::drush_modules'      # 7-Iron Drush Modules Test
include_recipe 'xdebug'                     # 7-Iron Xdebug Test
include_recipe '7-Iron::xhprof'             # 7-Iron Xhprof Test
~~~

Note:

1. The comment by each recipe identifies the test which covers it.
2. Recipes run **in the order they are listed**.
3. Recipes with the prefix `7-Iron::` are recipes provided specifically by the
   7-Iron cookbook.
4. Cookbook recipes **must be added to this list in order to run**.
5. When possible, do not call recipes from other wrapper type recipes.
    - Instead call library type recipes in the run list and change attribute
    settings for customization.

## 7-Iron::drush_modules

Install drush modules.

- coder-7.x-2.4
- registry_rebuild

## 7-Iron::logs

Install and configure the "PimpMyLog" app to read Apache amd PHP logs.

- Uses the cookbook file: `logs.conf.php`

## 7-Iron::mailcatcher

Configure PHP to use mailcatcher to capture & read emails during development.

- Add a bash profile entry to start mailcatcher on every login
- Uses the cookbook template `mailcatcher.ini.erb`
- Uses the cookbook files `email_test.php` which let's us test email sent from
  mail function.

## 7-Iron::php

Configure PHP with suport for Drupal development, after PHP install.

- Install additonal PHP packages
- Install pear Console_Table
- Runs after the php cookbook
- Uses the cookbook templates:
    - `php.ini.erb`
    - `php_cli.ini.erb`
- Uses the cookbook file `files/default/info.php` which contains `phpinfo();`

## 7-Iron::sites

Set up doc root, host file entries, and Vhost configs for the 7-Iron application sites.

- Add sites:
    - 7-Iron.dev The url for the site being developed.
    - 7-Iron.start The url for the 7-Iron start page.
- Uses the hostsfile cookbook.
- Uses the cookbook files:
    - `index.start.html`
    - `index.dev.html`
- Uses the template: `site_aliases.conf.erb`

## 7-Iron::system

Install & configure miscellaneous system components, directories & permissions.

See the [attribute](#attributes) `node['7-Iron']['system_packages']` for the list of system packages this recipe installs.

## 7-Iron::xhprof

Install and configure xhprof.

- Install pear xhprof
- Install graphviz
- Uses the cookbook templates
    - `xhprof.ini.erb`
    - `xhprof.conf.erb`

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
