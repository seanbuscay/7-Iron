<h1>Terms & Definitions</h1>

#### Chef
:   A systems and infrastructure automation framework that makes it easy to deploy servers and applications.

    Documentation Homepage: [Chef](http://docs.chef.io/)

#### Chef Recipes & Cookbooks
:   Chef recipes are where you specify how Chef should run server apps like Apache and MySQL and how they should be configured. Such recipes describe a set of resources which are supposed to be in a specific condition: packages to install, services to run, files to write. Chef will make certain that every resource is accurately set up and corrects any resource which isn’t in the right condition. -- From: [Acceptic.com](http://www.acceptic.com/blog/chef-how-to-cook-it-right.html)

    Chef recipes can be grouped together into cookbooks for ease of management.  Recipes and Cookbooks can be mixed together to form new cookbooks.  

#### Application Cookbooks
:   One of several emerging Chef Cookbook design patterns.  These patterns have overlapping attributes which has made it difficult for the Chef community to agree upon exact definitions for each pattern.

    Currently, I classify a cookbook as an application cookbook when the cookbook:

    - Represents a whole node to be installed/managed
    - Is very specific, not likely to be reused due to its focus on managing a complete system
    - Combines a set of library cookbooks[^library-cookbooks] into a coherent whole
    - Uses strict versioning of dependencies (e.g. "= 1.0.0"), including transitive ones

    From: https://github.com/berkshelf/berkshelf/issues/535#issuecomment-18327975

[^library-cookbooks]: See: https://github.com/berkshelf/berkshelf/issues/535#issuecomment-18327975

#### Vagrant
:   Computer software that makes it really easy to work with virtual machines.

    The business case involves saved time, a very low barrier to entry and the ability to give the exact same environment to somebody else. -- From: [24ways.org](http://24ways.org/2014/what-is-vagrant-and-why-should-i-care/)

    Documentation Homepage: [Vagrant](https://docs.vagrantup.com/v2/)

#### Boxes
:   Boxes are the package format for Vagrant environments.

    A box can be used by anyone on any platform that Vagrant supports to bring up an identical working environment. -- From: [VagrantUp.com](https://docs.vagrantup.com/v2/boxes.html)

#### 7-Iron Cookbook
:   The 7-Iron Cookbook is an application cookbook which describes for Chef how it should provision the 7-Iron Server software.

    For this use case, Chef deploys the software to a Vagrant box which then becomes the 7-Iron Server.

#### 7-Iron Server
:   The 7-Iron Server is a [Vagrant](#vagrant) [Box](#boxes) with a LAMP stack and environment for PHP and Drupal developers.

    The 7-Iron Server is built using [Chef](#chef) [recipes](#chef-recipes-cookbooks) from the 7-Iron [Application Cookbook](#application-cookbooks).




///Footnotes Go Here///
