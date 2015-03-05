<h1>Drupal Questions & Answers</h1>

## How can I setup and example Drupal site on 7-Iron?

Given:

- You want a site named, 'Example'
- You want a database named, 'example'

Then run the following commands:

```
cd ~workspace
drush dl drupal -y --drupal-project-rename=docroot
cd docroot
drush site-install -y standard --db-url='mysql://root:root@localhost/example' --site-name=Example
```


- TODO: How to use xhprof
- TODO: How to use xdebug

TODO: How to use drush

- TODO: rr
- TODO: site audit
- TODO: coder
- TODO: How to use phpcs
