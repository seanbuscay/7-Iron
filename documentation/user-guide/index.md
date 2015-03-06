<h1>User Guide Overview</h1>

## Quickstart

A. [Download the latest 7-Iron Vagrantfile](https://github.com/seanbuscay/7-Iron/releases/download/{!release_tag.txt!}/Vagrantfile) to your project's `docroot` directory.  

*TIP: Your project `docroot` is usually where your `index.php` or `index.html` is located.*

<hr/>

B. Deploy your site files to 7-Iron.

1. Run `vagrant up` in the directory you placed the Vagrantfile
2. View your project website at: [http://192.168.33.33/dev](http://192.168.33.33/dev)
    - Or [http://7-Iron.dev](http://7-Iron.dev) if you have already [edited you hosts file](questions-answers.md#how-do-i-edit-my-hosts-file-to-use-the-7-iron-urls)

<hr/>

C. Create or Import a DB.

- To create a db on 7-Iron see: [How do I create a new db?](database-mysql.md#how-do-i-create-a-new-db)
- To import a project database into 7-Iron, see: [How do I import my project database?](database-mysql.md#how-do-i-import-my-project-database)

## Next Steps

- [Edit your host machine's hosts file](questions-answers.md#how-do-i-edit-my-hosts-file-to-use-the-7-iron-urls) to use 7-Iron's URLs
- Change your [sync type](project-files.md#-sync-types) to speed up file syncing
- Checkout the [Tools](tools.md) section to see what tools are available to you on 7-Iron.
- Read [How to Manage Your Project Files with 7-Iron](project-files.md) for details about the different deploy/file share strategies you can use with 7-Iron.
