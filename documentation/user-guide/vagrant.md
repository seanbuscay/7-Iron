<h1>Vagrant Questions & Answers</h1>

## How do I get the 7-Iron Vagrantfile?

Right click (or Command click) on the link below and choose 'Save link as...'

[7-Iron Vagrantfile](../../appendix/Vagrantfile.txt)

Then save the file as 'Vagrantfile' without any file extension.

Put the Vagrantfile in any directory you would like to run a 7-Iron Server instance.

Run `vagrant up`.

## How do I set up NFS on my Mac?

NFS comes pre-installed on OSX 10.5+.

To verify it is running, run the following command in the Mac terminal:

```
sudo nfsd start
```

You should see an output like this:

```
The nfsd service is already running.
```

If you do not, follow the instructions in this wiki:

http://wiki.xbmc.org/?title=NFS#NFS_sharing_from_OS_X

*Troubleshooting:*

If you get a message about the NFS Export File being invalid, this is a known issue with Vagrant.

Run the commands below to fix it:

```
sudo rm /etc/exports
sudo touch /etc/exports

vagrant halt
vagrant up --provision
```
