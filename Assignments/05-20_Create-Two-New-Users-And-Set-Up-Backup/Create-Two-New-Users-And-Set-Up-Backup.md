# Install Homebrew, Create Moniker and Shared Users, and Set Up Backups

## Install `homebrew` 

[`homebrew`](https://docs.brew.sh/Homebrew-on-Linux) is an alternative to the built-in `package manager` called `apt` that is the default for `Debian`-based Linux distributions like Ubuntu.

You will install homebrew by pasting the link at the bottom of this section into your
terminal.

While the set of tools you can install using homebrew is less complete than those that you can
install using apt, homebrew has several advantages:

1. It is cross-platform
   * It works the same way on many linux distributions and MacOS
1. It is well documented
   * Google searches can usually help solve any problems
1. It installs everything in a predictable and well-organized location
   * On Linux machines, the method you should use is the `recommended` one
      * This will create a new user on your machine named `linuxbrew`
	 
`/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install.sh)"`

## Create A User For Your Own Stuff

1. Either using the `command line` or using the `Users and Groups` GUI tool, create a 
user with a username corresponding to your moniker (family name, first initial, middle initial).
Like for me, the user would be `carrollcd`. 
   * It's best to use all lower case letters because Linux is case sensitive
   * This shuld be an "administrative user"
   * Pick your own password, but be sure to RECORD IT SOMEWHERE YOU CAN FIND LATER
1. Log in to your new user
   * You will need to log out as the econ-ark user to do this
1. Delete all of the (empty) folders that will have been created automatically for you:
   * Downloads, Pictures, Videos, Music, etc

## Create the Shared User

1. Create another user named Shared
   * Give it the standard econ-ark password: kra-noce
1. As before, login and delete the junk folders
1. Now create the following folders:
   * GitHub
   * Downloads
1. Change the permissions for these folders to "all can read, write, and execute"

## Link the Accounts

1. Make some useful "soft links" 
   * cd /home/[Moniker]/ 
   * ln -s /home/Shared/Downloads /home/[Moniker]
   * ln -s /home/Shared/GitHub          /home/[Moniker]/GitHub-Shared
   * ln -s /usr/local/share/data/GitHub /home/[Moniker]/GitHub-ARK
1. Make identical new links in the econ-ark user's directory

1. Briefly explain what you think are the reasons for the instructions above

## Set Up A Backup System

Because backing up your computer is such a boring task, and therefore so easy
to put off, the only appropriate way to handle backups is to have a system that 
is: 

* Automatic
* Comprehensive
* Customized
* Non-local (e.g., on the cloud)

Backup strategies range from "turnkey" systems, where you basically install one piece of software on your computer, pay some monthly fee ($10?), and then forget about it, to "handmade" systems in which a user has written their own completely customized system relying on their own resources. E.g., my JHU office Mac backs itself up to my home filesystem and my machines at home back themselves up to each other and to the cloud.

The strategy I want you to pursue is an intermediate one, which has the advantage of being 
free (at least for small backups, like those you will need to make for your course machine).

Specifically, the strategy involves installation of a software tool that runs on your computer,
and which can then connect to any of a variety of remote storage services (you choose). 

The tool I want you to use is called [`Duplicati`](https://duplicati.readthedocs.io/en/latest/02-installation/#installing-duplicati-on-linux).

(Follow the Linux installation instructions available on the website, supplemented by [these further instructions](https://forum.duplicati.com/installing-duplicati-on-linux-ubuntu-linuxlite/743) - except that I found I needed to 
install the full version of `mono` and not just `mono-runtime` (it's better if mono-runtime works for you because the full version of mono is big).

I expect you to use common sense in interpreting the instructions; for example, the preparation instructions advise you to install a variety of packages, including python, but obviously you know that python is already installed. Or, the instructions tell you to create some config files using the `nano` editor, but you presumably will want to use emacs instead.

As for backends, you will need to make that choice yourself among the many options. One option is Google Drive,
and I believe that Google provides 15gb of free storage to users, so you could use that. Another option is
to back up to your own network drive hosted on the web, but that requires you to have set that up yourself.
Another is Box.com; you have a free Box.com account as part of your login ID. You may also be able to use 
Microsoft OneDrive. Finally, if none of these works, you can get an account at "Mega" with 15gb of free storage.



