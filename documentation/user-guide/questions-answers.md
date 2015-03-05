<h1>User Guide Questions & Answers</h1>

The future home of user questions and answers as they come.

Please submit your own questions, or questions with answers here: [https://github.com/seanbuscay/7-Iron/issues/new](https://github.com/seanbuscay/7-Iron/issues/new)

## How do I Edit my Hosts file to use the 7-Iron URLs?

In order to access 7-Iron in your browser via URLs instead of an IP address, you will need to add the following entry to your hosts file to tell your host to point any calls to the 7-Iron domains back to the 7-Iron Server's IP address.

```
192.168.33.33 7-Iron.start www.7-Iron.start 7-iron.dev www.7-Iron.dev
```

**On an OSX host** you can do this from the terminal using the following command:

```
sudo nano /private/etc/hosts
```
Then paste the new entry in and save the file.

You may need to flush your DNS cache for the change to take affect.  To do so, on OSX Mavericks or above, run:

```
dscacheutil -flushcache; sudo killall -HUP mDNSResponder
```

**On a Ubuntu host**, you can run the following command:

```
sudo nano /etc/hosts
```
Then paste the new entry in and save the file.

You may need to flush your DNS cache for the change to take affect.

```
sudo ifdown eth0 && sudo ifup eth0
```

**On a Windows host**, you may find your `hosts` file here: `C:\Windows\System32\drivers\etc`

You will need to edit the file with a text editor as an admin user.

You may need to flush your DNS cache for the change to take affect.  To do so:

1. Right click on Command Prompt and click Run as administrator.
2. Type in the command `ipconfig /flushdns`



# More Questions & Answers

- [Database / MySQL Questions & Answers](database-mysql.md)
- [Vagrant Questions & Answers](vagrant.md)
- [Drupal Questions & Answers](drupal.md)
