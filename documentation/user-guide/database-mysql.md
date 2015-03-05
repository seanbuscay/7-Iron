<h1>Database / MySQL Questions & Answers</h1>

## What's the MySQL Server user name and password?

- username = root
- password = root

## How do I create a new db?

**Given**

You wish to create a new database named, 'devsite'

**Then**

Run the following command to create the database:

```
mysqladmin -uroot -proot create devsite
```

## How do I list the databases in MySQL?

Run the following command:

```
echo "show databases" | mysql -uroot -proot
```

## How do I import my project database?

**Given**

- You have an sql export of your database on your host system in a file named, 'db.sql'
- For step `1` below, you have a terminal open to the directory where your sql export is saved
    - This may be any directory on your system
    - It does not need to be in your Vagrant directory
- For all other steps, you have the terminal open in the same directory as your Vagrantfile
- You are NOT logged into the Vagrant box

**Notes**

The command in step `1` may ask you to accept an ssh key.  Type 'yes' to accept it.

**Then**

1. Run the following command and enter `vagrant` for the password:

    ```
    scp -P 2222 db.sql vagrant@localhost:./workspace
    ```

2. Create a new db named 'devsite' (or whatever you like). Run:

    ```
    vagrant ssh -c 'mysqladmin -uroot -proot create devsite'
    ```

3. List the databases to make sure your db was created. Run:

    ```
    vagrant ssh -c 'echo "show databases" | mysql -uroot -proot'
    ```

4. Now import your db. Run:

    ```
    vagrant ssh -c 'mysql -uroot -proot devsite < ./workspace/db.sql'
    ```

BACKLOG: How to Acesss mysql server from host tools like MySQL workbench. 
