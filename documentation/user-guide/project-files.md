<h1>How to Manage Your Project Files with 7-Iron</h1>

## Introduction

Your files are most likely part of a project in a VCS repo.  *Those files you want deployed to the 7-Iron Vagrant box* may or may not include everything in your project repo.

You may, for example, only want 7-Iron to run your web files.  In this case the files you deploy will only be those you keep in a sub-directory such as `docroot`.  However, if you want 7-Iron to run your web files and your Behat feature tests, then your deploy files will include both your `docroot` and your `features` directory.

In another scenario you may want to deploy everything to 7-Iron but exclude your `.git` directory to save on sync time.  

Consider what files you want to deploy to 7-Iron as we cover ways to manage your project files with 7-Iron.

Let's cover three ways to manage your project files with 7-Iron.  These include:

1. No synchronization
2. Vagrant managed synced folders
3. Treating 7-Iron as a remote server

## 1. No Synchronization

By default, 7-Iron starts with no synchronization.

This is useful if you would like to just test drive 7-Iron, or if you would like to checkout and manage your project code only on the 7-Iron Server and not on your host.

Use cases include:

- A QA tester needs to check out and run a tagged version of a website
- A Merge Manager needs to review one or more branches of code before approving a pull request
- A automated test system needs to check out and run a series of BDD and Unit tests

With this method just use 7-Iron from the command line and check out code as you would to any Unix based system.  You can turn on SSH key forwarding if you want to forward your SSH key from your host to 7-Iron.

## 2. Vagrant Managed Synced Folders

> Synced folders enable Vagrant to sync a folder on the host machine to the guest machine, allowing you to continue working on your project's files on your host machine, but use the resources in the guest machine to compile or run your project.  -- [VagrantUp.com](https://docs.vagrantup.com/v2/synced-folders/index.html)

The documentation section on the Vagrant website covers [Synced Folders](https://docs.vagrantup.com/v2/synced-folders/index.html) in detail.  

### - Sync types

The 7-Iron Vagrant file has entries to use any of these three types of synced folder support:

- [NFS](https://docs.vagrantup.com/v2/synced-folders/nfs.html)
- [Rsync](https://docs.vagrantup.com/v2/synced-folders/rsync.html)
- [Virtual Box](https://docs.vagrantup.com/v2/synced-folders/virtualbox.html)

I recommend using Rsync for large projects, and NFS for most projects.  Please read the documentation in the links above for the type you'd like to use.

Then, edit this section in the Vagrant file to uncomment and use your desired sync type:

```
# Uncomment the line below to use the default synced folder type (Virtual box).
# config.vm.synced_folder sync_source, sync_target

# Unccoment the line below to use the nfs synced folder type
# config.vm.synced_folder sync_source , sync_target, type: 'nfs'

# Uncomment the three lines below to use the rsync synced folder type
# config.vm.synced_folder sync_source, sync_target, type: "rsync",
#   rsync__exclude: ".git/",
#   rsync__auto: true
```

See also:

- [How do I set up NFS on my Mac?](vagrant.md#how-do-i-set-up-nfs-on-my-mac)

### - Usage Scenarios

The following two scenarios illustrate ways to use synced folders with 7-Iron.

#### -- Scenario One - Just serve web pages:

By default, when a sync type is enabled,  the 7-Iron Vagrant file will sync the directory it is in to:

`/home/vagrant/workspace/docroot`

To use 7-Iron to serve your project's webpages, put this Vagrant file in your project's web root directory.

Hint: where index.php or index.html is located.

#### -- Scenario Two - Run tests and serve web pages.

Given your project's web docroot is one level down like this:

```
/tests
/docroot
/docroot/index.php
/docroot/robots.txt
```

And you put the 7-Iron Vagrantfile at the top level of your project like this:

```
/Vagrantfile
/tests
/docroot
```

And you uncomment this line `#sync_target = "/home/vagrant/workspace"` in the 7-Iron Vagrant file.

Then, 7-Iron will sync your project directories like this:

```
/home/vagrant/workspace/tests
/home/vagrant/workspace/docroot/index.php
/home/vagrant/workspace/docroot/robots.txt
```

And you may run your tests on 7-Iron as well as serve your web pages.

Tip: Add `.vagrant` to your `.gitignore` file to keep from committing the directory.

## 3. Treating 7-Iron as a Remote Server

You can connect to 7-Iron via SSH on port 22 with the user name: `vagrant` and the password `vagrant`.

### - Use Secure Copy to move files between your host and 7-Iron Server

From your host command line you can use [SCP](http://en.wikipedia.org/wiki/Secure_copy) to move files from your host to 7-Iron, and from 7-Iron to your host.

Below are two examples:

1. To copy all files from a `wesbite` directory your host to the `docroot` directory on 7-Iron, run the following command:
    ```
    scp -P 2222 -r website vagrant@localhost:./workspace/docroot
    ```
2. To copy all files back, this time from the `docroot` on 7-Iron to your host `website` directory, run:
    ```
    scp -P 2222 -r vagrant@localhost:./workspace/docroot website
    ```

**Note:** SCP runs a copy command and not a sync.  Files will be overwritten and dead wood files will not be cleaned up.

### - Use IDEs or other Software to Sync and Deploy Files

You can also use an SFTP tool [^sftp-tool] or you IDE to develop your files locally and then sync/deploy them as needed to 7-Iron.

You can connect to 7-Iron via SFTP on port 22 with the user name: `vagrant` and the password `vagrant`.

If for example, you use the PHPStorm IDE, you can [add 7-Iron as a remote server](https://www.jetbrains.com/phpstorm/help/create-new-project-add-remote-server.html) , then [copy your files to 7-Iron](https://www.jetbrains.com/phpstorm/help/working-with-web-servers-copying-files.html), and [keep them in sync](https://www.jetbrains.com/phpstorm/help/configuring-synchronization-with-a-web-server.html).

[^sftp-tool]: Like FileZilla -The free FTP solution: https://filezilla-project.org/

///Footnotes Go Here///
