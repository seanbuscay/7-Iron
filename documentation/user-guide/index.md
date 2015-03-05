<h1>User Guide Overview</h1>

## Quickstart

### - Deploy your site files to 7-Iron

1. Edit your host machine's `hosts` file[^use-ip] to use 7-Iron's URLs: [GO](questions-answers.md#how-do-i-edit-my-hosts-file-to-use-the-7-iron-urls)
2. Place the 7-Iron Vagrantfile in your project's `docroot` directory
3. In the Vagrantfile, uncomment the line below to use the default synced folder type
    ```
    # config.vm.synced_folder sync_source, sync_target
    ```

    See: [Sync Types](project-files.md#-sync-types) for other sync types.

4. Run `vagrant up` in the directory you placed the Vagrantfile
5. Access your project's `docroot` via the following URL: http://7-iron.dev

### - Create or Import a DB

- To create a db on 7-Iron see: [How do I create a new db?](database-mysql.md#how-do-i-create-a-new-db)
- To import a project database into 7-Iron, see: [How do I import my project database?](database-mysql.md#how-do-i-import-my-project-database)

### - Login to 7-Iron to Use Drush and Other Tools

To login to the 7-Iron Server run:

`vagrant ssh`

## Next Steps

- Read documentation for your version of 7-Iron at http://7-Iron.start
- Change your [sync type](project-files.md#-sync-types) to speed up file syncing
- Checkout the [Tools][tools.md] section to see what tools are available to you on 7-Iron.
- Read [How to Manage Your Project Files with 7-Iron](project-files.md) for details about the different deploy/file share strategies you can use with 7-Iron.

[^use-ip]:
  If you cannot or do not want to edit your hosts file, you can still access 7-Iron with its IP address:

      - http://http://192.168.33.33/dev/ for your dev site.
      - http://192.168.33.33/ for 7-Iron documentation and tools.


///Footnotes Go Here///
