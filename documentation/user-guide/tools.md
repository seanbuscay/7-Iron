<h1>User Tools</h1>

## The Terminal

One of the primary tools you'll use to interact with the 7-Iron Server is the terminal.  Below are a few notes about running commands with a Vagrant box.

You can run commands on the Vagrant box without logging in.

Preface the command you want to run on Vagrant with: `vagrant ssh -c` and put the command you want to run in quotes.

For example, both commands below will create a new database named, 'devsite' in MySQL on the 7-Iron Server.

```
mysqladmin -uroot -proot create devsite
```

```
vagrant ssh -c 'mysqladmin -uroot -proot create devsite'
```

The first version is run in 7-Iron's terminal after you log in with `vagrant ssh`.
The second version is run in your host terminal without logging in.

**Unless otherwise noted, the commands in this documentation are written as if you have logged into the 7-Iron Vagrant box.**  In many cases you can also run them without logging in, by modifying them like the example above.

**Logged In Assumes:**

- You have logged into the Vagrant box
- The commands you run are within the 7-Iron server, using its terminal
- Commands begin from the home directory of the Vagrant user

To log into the 7-Iron box, from your host machine's terminal, in the directory with the 7-Iron Vagrantfile, run:

```
vagrant ssh
```

**Not Logged In Assumes:**

- You are on your host machine (not logged into the Vagrant box)
- You have the terminal open in the same directory as your Vagrantfile

## MailCatcher

7-Iron uses [MailCatcher](http://mailcatcher.me/) to catch all mail and store it for display.

You can safely use 7-Iron to test mail based features for your application, without having the email actually be sent over the internet.

To view mail sent on the server, visit: [http://7-Iron.start:1080](http://7-Iron.start:1080)

## Logs Viewer

7-Iron uses [Pimp my Log](http://pimpmylog.com/) to display and view PHP and Apache logs.

To view 7-Iron Server logs, visit: [http://7-Iron.start/logs](http://7-Iron.start/logs)

**Note:** This feature is in an alpha state and we may change the tool if we find a better one.
