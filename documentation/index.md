# 7-Iron Server

*Your "Go-to" Vagrant Box for PHP and Drupal Development*

7-Iron is:

1. A LAMP Server in a Vagrant Box for PHP and Drupal developers
2. A Chef Cookbook and Packer template to build your own custom LAMP server
3. Covered by over 100 automated tests to ensure your system will work as expected

## Start Using 7-Iron Server Now

1. [Download the latest 7-Iron Vagrantfile](https://github.com/seanbuscay/7-Iron/releases/download/{!release_tag.txt!}/Vagrantfile)
2. Run `vagrant up` in the directory you saved the Vagrantfile.

Visit: [User Guide Overview](user-guide/index.md) for next steps.

## Documentation for...

[Vagrant Box Users](user-guide/index.md) | [Cookbook Users](cookbook-guide/index.md) | [Contributors](contributor-guide/index.md)

## Why 7-Iron?

I wrote 7-Iron to give all team members of web development projects a:

- **consistent** and **trusted** development environment
- **with all the tools** each member needed
- to **get up and running quickly and easily** on the project.

7-Iron Vagrant Boxes:

- are **versioned, with frozen dependencies between releases**
- **pass over 125 automated tests** before each release to verify the server **works as expected**.  

With each release of 7-Iron **you know what you are getting**, and **know what you are sharing** with other team members, QA, clients, and anyone else.  

Backed by Vagrant:

> Whether you're working on Linux, Mac OS X, or Windows, all your team members [run] code in the same environment, against the same dependencies, all configured the same way. -- From: [Why Vagrant?](https://docs.vagrantup.com/v2/why-vagrant/index.html)

7-Iron focuses on providing the tools and default settings team members need **to be productive during development**, while avoiding making a Vagrant box that is:

1. too anemic in memory and configuration settings
2. too overloaded with software incase a user "might need it"
3. too brittle for daily development and debugging (because too much value was placed on matching a development environment to the production environment)

### Community

I also hope 7-Iron will become community managed, developed, and supported.  In this way, we can all benefit from shared use and contribution.

Anyone can contribute, from testing driving 7-Iron, asking questions, proofing documentation, reporting bugs, writing and improving tests, and developing the cookbook.  

Please join me and submit/answer issues and comments here: [https://github.com/seanbuscay/7-Iron/issues/](https://github.com/seanbuscay/7-Iron/issues/)

## Project Home

- [7-Iron on GitHub](https://github.com/seanbuscay/7-Iron)
- [7-Iron Releases](https://github.com/seanbuscay/7-Iron/releases)

<hr/>

Note: This documentation has been written for 7-Iron - **{!release_tag.txt!}**
