# 7-Iron Server

*Your "Go-to" Vagrant Box for PHP and Drupal Development*

7-Iron is:

1. A LAMP Server in a Vagrant Box for PHP and Drupal developers
2. A Chef Cookbook and Packer template to build your own custom LAMP server
3. Covered by over 100 automated tests to ensure your system will work as expected

## For 7-Iron Vagrant Box Users

**You do not need to clone or build anything from the 7-Iron repository.**

Simply run these two commands to start using 7-Iron:

```
vagrant init seanbuscay/7-Iron
vagrant up
```
Then visit: [User Guide: Quickstart](http://7-iron.github.io/user-guide/#quickstart)

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
