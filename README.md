shell_history
=============

How it works
------------

login:
- get the latest from git 
- update the .bash_history

logout:
- store the .bash_history in ~/shell_history_src/history.txt
- push the changes to git repo


Note: we might need some kind of db persistence just incase if user machine reboots???

How To Run
------------
To create the File/Folder structure required by the service run the following rake task 
and point it to the git repo. This repo is being used to keep track of the changes in .bash_history.

```
$ bundler install

$ rake fs:create[https://github.com/nino2armando/shell_history_src.git]
```
add ```shell_history/scripts/login_script.sh``` to /init/rc.local

add ```shell_history/scripts/logout_script.sh``` to /init/rc6.d

todo
------------
back up user changes and tons of testing...





