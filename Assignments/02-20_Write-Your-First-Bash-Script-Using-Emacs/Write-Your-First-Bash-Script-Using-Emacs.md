
This assignment takes you through the process of writing your first bash script using Emacs in your VM.

Before beginning the assignment, please read through the first two chapters, [Inception](https://guide.bash.academy/inception/)
and [Commands and Arguments](https://guide.bash.academy/commands/) of [The Bash Guide](https://guide.bash.academy/) and
do the associated exercisese.

When that is done, complete the assignment below (which combines elementary bash with elementary Emacs usage)

0. Launch `Emacs` from the terminal using the command `emacs -nw` 

0. Create a new file by hitting C-x C-f (that's short for CTRL-x followed by CTRL-f)

   * Emacs will pop up a little `minibuffer` at the _bottom_ of the terminal saying `Find file:`

   * This is its way of asking you the filename you want to use

   * Give it a filename `First-Bash-Script-[Moniker].sh`

0. As the first line of the script, enter the exact letters `#!/bin/bash`

   * This is the magic spell that identifies the file as a bash script file

0. Now hit return a couple of times and type `echo "Hello world!"`

0. Hit `C-x C-s` (Control-x followed by Control-s) to save the file

0. Hit `C-x C-c` to exit from Emacs

0. In the `Terminal` shell, type `cd ~` to change the directory to the home directory `~` where you created the file

0. Before the file can be executed, it must be marked as executable.

   * This is done using the `chmod` command (short for `change the modification characteristics of the file`)

   * The specific command you must use is `chmod a+x *.sh`

   * The `*.sh` syntax means `all files ending in .sh`

0. Now you should be able to execute the file in either of two ways:

   0. Type `/bin/bash First-Bash-Script-[Moniker].sh`

   0. Type `./First-Bash-Script-[Moniker].sh`

0. Capture the magnificent results of your efforts in an output file by adding ` > First-Bash-Script-[Moniker].out` after typing one of the above options to execute the .sh file. For example,

   `./First-Bash-Script-[Moniker].sh  > First-Bash-Script-[Moniker].out`

0. View the results in two ways:

   0.  At the shell type `cat *.out`

      * The `cat` command gives a `catalog` of the contents of the files that are its argument

      * Since there is only one file ending in `.out` the catalog has only your program's output

   0. Open the file using the command `emacs First-Bash-Script-[Moniker].out`

      * You will notice that this time, Emacs opens as a graphical application in its own window

      * The reason is that your previous invocation of emacs included the `-nw` flag, which is short for `no window` and has the effect of launching emacs inside the shell window

0. Update your local copy of the class "Methods" repository:

    `cd ~/GitHub/ccarrollATjhuecon/Methods`
    `git pull`

0. Move your script to the /Assignments/[##-##]-Write-Your-First-Bash-Script-Using-Emacs in the
local copy the "Methods" repo


