<h1>User Guide Overview</h1>

## Recommended Use

The following section provides a recommended way to use 7-Iron.  If you already know how you want to use 7-Iron, you can jump to [Quickstart](#quickstart) below.

### Project Setup

From the [VagrantUp.com website](https://docs.vagrantup.com/v2/vagrantfile/index.html):

> Vagrant is meant to run with one Vagrantfile per project, and the Vagrantfile is supposed to be committed to version control. This allows other developers involved in the project to check out the code, run vagrant up, and be on their way. 

1. [Download the latest 7-Iron Vagrantfile](https://github.com/seanbuscay/7-Iron/releases/download/{!release_tag.txt!}/Vagrantfile)
2. Put the 7-Iron Vagrantfile in your project `docroot` or a level up if you want to include test directories or other files you need to sync to the 7-Iron Vagrant Box. ([More info..](user-guide/project-files.md#-usage-scenarios))
3.  Choose the sync type you'd like to use and edit your Vagrantfile to reflect your choice.  I recommend NFS or Rsync.  ([More info..](user-guide/project-files.md#-sync-types))
4. Add `.vagrant` to your `.gitignore` file 
5. Commit and push your changes to the project repo

### Host Machine Setup

Add the following entry to your host machine's `hosts` file:

```
192.168.33.33 7-Iron.start www.7-Iron.start 7-iron.dev www.7-Iron.dev
```

[More info..](user-guide/questions-answers.md#how-do-i-edit-my-hosts-file-to-use-the-7-iron-urls)

### Daily Use

1. Pull the latest changes from the project
2. CD to the directory with the 7-Iron Vagrantfile
3. Run `vagrant up`
4. Access the project website at: http://7-iron.dev
5. Access 7-Iron Server Documentation and Tools at: http://7-Iron.start

Happy Developing! 

Make sure to check out the [Next Steps](#next-steps) section below.

Please [submit any issues or questions](https://github.com/seanbuscay/7-Iron/issues) you may have.


## Quickstart 

**A. [Download the latest 7-Iron Vagrantfile](https://github.com/seanbuscay/7-Iron/releases/download/{!release_tag.txt!}/Vagrantfile) to your project's `docroot` directory.**

*TIP: Your project `docroot` is usually where your `index.php` or `index.html` is located.*

**B. Deploy your site files to 7-Iron.**

1. Run `vagrant up` in the directory you placed the Vagrantfile
2. View your project website at: [http://192.168.33.33/dev](http://192.168.33.33/dev)
    - Or [http://7-Iron.dev](http://7-Iron.dev) if you have already [edited you hosts file](questions-answers.md#how-do-i-edit-my-hosts-file-to-use-the-7-iron-urls)

**C. Create or Import a DB.**

- To create a db on 7-Iron see: [How do I create a new db?](database-mysql.md#how-do-i-create-a-new-db)
- To import a project database into 7-Iron, see: [How do I import my project database?](database-mysql.md#how-do-i-import-my-project-database)

## Next Steps

- [Edit your host machine's hosts file](questions-answers.md#how-do-i-edit-my-hosts-file-to-use-the-7-iron-urls) to use 7-Iron's URLs
- Change your [sync type](project-files.md#-sync-types) to speed up file syncing
- Checkout the [Tools](tools.md) section to see what tools are available to you on 7-Iron.
- Read [How to Manage Your Project Files with 7-Iron](project-files.md) for details about the different deploy/file share strategies you can use with 7-Iron.
