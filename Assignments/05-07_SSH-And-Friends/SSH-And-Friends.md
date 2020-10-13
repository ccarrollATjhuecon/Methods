# Interacting Remotely with an SSH-Enabled Machine

Unix computers that have enabled the `secure shell` (SSH) protocol can be controlled remotely using a suite of tools
that allow interaction with the remote computer almost as if the user were physically present

* On your VM, ssh has been enabled with the shell command `sudo apt -y install openssh-server`

## Login via SSH
0. Connecting via SSH requires, at a minimum, knowledge of a username and password for the computer being connected to
0. At any given moment, if you are at the command prompt of a specific machine running unix, there is only one machine in the universe that is absolutely guaranteed to be accessible: That machine whose command prompt you are at!
   * We will therefore illustrate the use of the ssh commend by doing something pretty meta: Connecting via ssh to THE SAME COMPUTER YOU ARE CONNECTING FROM
0. Steps:
   * Launch a `Terminal` window (and NOT a shell prompt from inside emacs)
   * Become the root user (superuser) using the `su` command
      * This requires you to have enabled the root user in your VM; if you have not done this, do so using the command `sudo passwd root` and give the root user the same password as the `methods` user (Google for more info)
   * Test whether you have succeeded by using the `whoami` command
      * The answer should be `root`
   * `ssh methods@localhost` will initiate a `remote` connection from your own computer to itself
	  * (By default, in unix your own computer can be addressed as `localhost`)
      * If this is the first time you have connected from your current machine to the remote machine, you will asked to permit the connection va a `key fingerprint` which is a security mechanism. Accept this request
   * If instead of `localhost` you specified some other valid username and hostname, you would connect as that user to that machine instead
      * Assuming that the connection is permitted by firewalls and other security mechanisms...
	  * And that connecting by ssh has been enabled on the other machine
0. You should now be connected to the remote computer on precisely the same footing you would have if you had logged into the computer from a physical connection like a keyboard
   * Confirm that you are logged in as the methods user using the `whoami` command
   * A second proof that you are logged in as the methods user is to use the command `ls`
   * You should see the usual default list of folders from your home directory
0. Exit from your secure shell:
   * `exit` is the command
   * `whoami` should now identify you as the `root` user again
   * `exit` from your status as superuser and return to your normal identity
0. There is no need to become the root user in order to use the secure shell
   * This was done here mainly to avoid confusion
   * When the methods user uses ssh to connect as the methods user to localost, everything looks identical to the way it would look before the ssh command
   * Logging in as root first allows you to see that you have actually accomplished something with the ssh command

## Copy files via `scp`

Once you have exited back to your original `methods` identity, it is time to learn the second tool in the ssh suite: `scp` which is short for `secure copy`

The syntax for the `scp` command is similar to that of the regular copy command `cp` except that the copying can occur between remote machines.

We are going to again become root for the purpose of executing this command. Below is the sequence of commands you should type at a terminal shell to copy all of the assignments from the Methods class to a new directory `/tmp/Methods/Assignments`:

    su # to become the root user -- you will have to give the password
	mkdir -p /tmp/Methods/Assignments # to create the directory into which the files will be copied
	scp -r methods@localhost:/home/methods/GitHub/Methods/Assignments/* /tmp/Methods/Assignments

A Google search for `scp command examples` will turn up a host of other ways to use the command. You can also do a bit of
prep work so that you do not need to enter your password for the remote machine every time you use the command.

## SSH keys

If you will be connecting regularly from your computer to online resources using ssh tools, it will be convenient for your user to have a a `key` that you can upload to the remote resource machine so that it can recognize your machine without the necessity of always entering a username and password.

The default location for such a key is the `~/.ssh/` directory. The default kind of key is an RSA key, which has two parts, a `private` part named `~/.ssh/id_rsa` and a `public` part named `~/.ssh/id_rsa.pub`.  

If such keys do not exist already, you can generate them with a shell command like:

	ssh-keygen -t rsa -b 4096 -C "methods VM of [Moniker]" # This is a "Comment" that lets you identify the key

   * You will be prompted to "Enter a file in which to save the key."
   * You should hit the enter (or return) key to accept the default location proposed
   * You will then be asked to enter a passphrase
   * Again you can just hit enter

If the keys DO exist already, you need to make sure they have the right permissions and ownership:

  `cd ~`
  `sudo chown -Rf methods ~/.ssh`
  `sudo chmod 600 ~/.ssh/id_rsa`
  `sudo chmod 644 ~/.ssh/id_rsa.pub`

## Registering your key with a remote resource (GitHub)

   Registering your key allows you to interact with a remote machine without the cumbersome requirement to enter a username and password at every step. This is particularly convenient when interacting with GitHub.

   Instructions for how register your ssh key with your GitHub account [are here](https://help.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account)

   You should follow those instructions (since your machine should already have a key, you can omit the step of generating one)

   In order to interact with a remote repo without using password or username, you need to adjust GitHub's url for connecting with the remote resource via ssh rather than https.  For example, if you obtained a repo originally by

   `git clone https://github.com/llorracc/BufferStockTheory.git`

   then, inside the cloned BufferStockTheory directory, you asked

   `git remote -v`

   the answer would be

   `origin	https://github.com/ccarrollATjhuecon/BST-Shared.git (fetch)`
   `origin	https://github.com/ccarrollATjhuecon/BST-Shared.git (push)`

You would need to change this using a command like:

  `git remote set-url origin git@github.com/ccarrollATjhuecon/BST-Shared.git`

## Git Credential Helper

Another way to avoid having always to enter your password is to use a `credential-helper`

On Win or Mac machines, it is possible to configure the credential helper so that you never need to enter your credentials again for interacting with a repo.

On Linux machines, the credential helper tool is more limited: As with the timeout on the sudo command, there is an 'expiration date' (defaulting to 3600 seconds) after which you will be required to reenter username and password.

To set up the credential helper, from a shell:

   `git config --global credential.helper cache`
   `git config --global credential.helper 'cache --timeout=3600'`

## Mount A Network Drive

The `sshfs` tool allows you to securely mount a directory or drive on the remote machine in such a way that, while mounted, it becomes part of the filesystem of the host machine.

	sudo apt -y install sshfs # It is probably already installed
	sudo mkdir -p /mnt/Methods # Make the 'mount point' where the new content will be accessible
	sudo sshfs -o allow_other -o IdentityFile=~/.ssh/id_rsa.pub methods@localhost:/home/methods/GitHub/Methods /mnt/Methods

Now if you do

	ls /home/methods/GitHub/Methods
	ls /mnt/Methods

you should see exactly the same listing, because these are two paths to the same object

The command to unmount:

	sudo fusermount -u /mnt/Methods
