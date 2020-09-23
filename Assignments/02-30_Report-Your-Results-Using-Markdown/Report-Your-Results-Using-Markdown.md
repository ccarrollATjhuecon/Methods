
This assignment is for you to learn to use emacs and Markdown and GitHub to give feedback on assignments, using PRs that will not be merged

* Because I fiddle with the numbers that prefix the name of files, when you see `[Num]` below, that is a standin for whatever the actual numerical prefix is for the file in question. So, for example, I would refer to this file as `[Num]_Report-Your-Results-Using-Markdown.md`

1. First you need a fork of the Methods repo.  If you have already interacted with it by making a PR, then you already have a fork.  Otherwise, just go to https://github.com/ccarrollATjhuecon/Methods (WHILE LOGGED INTO YOUR OWN GITHUB ACCCOUNT), and click the Fork button.

1. Next, clone your fork to your local computer, where you will be editing each of the assignments

0. Using Emacs, edit the assignments as described below:

0. All lines you add to the files should end with your initials (FirstMiddleLast, [FML])

0. For example, if this were a line I had added, it would end with [CDC]

0. For each line in the assignment that asks you to do something, you should make one of three responses

   1. If you executed the step with no difficulty and the instructions were easy to follow, you can just write Done [FML].  The next line provides an example, if I were a student, of how I would respond to the current line if I had finished going through all the assignments and had done everything:

      * Done [CDC]

   0. If the instructions were clear enough (in retrospect) but they were difficult to execute in practice, you might provide a response like

      * Done (but hard) [CDC]

   0. If the instructions were not clear enough for you to be able to figure out what to do and you were unable to accomplish it, you should provide a description of what you tried and your guess of why it failed.  For example, if you did not have write permission for the files and could not figure out how to grant yourself such permission, you might write:

      * I couldn't change the names of the files to add my moniker because I did not have the right permissions  [CDC]

   0. When you find a place where you think the instructions should be improved or added to or clarified, you should post a GitHub "issue" containing your proposed edits. For example, you might want to edit the line earlier in the this assignment that reads:

       0. All lines you add to the files should end with your initials (FirstMiddleLast, [FML])
	   
	   instead to say
	   
       0. All lines you add to the files should end with your initials (FirstMiddleLast, [FML]). If you do not have a middle name, use the letter X [CXC]

   0. When you are done editing the assignments, you should be able to examine the resulting prettified Markdown document by hitting C-c C-c p (that is, Control-C, Control-C, p). You may want to search about this command online. (Google: `markdown editing mode in emacs`)
   
0. When you are done with editing each assignment:
   * add your changes to your fork of the repo:
      `git add [whatever is the assignment name]`
   * commit the assignment with a commit command:
      `git commit -m 'This is Rays new version of the assignment`
   * push the new version to your online fork:
      `git push` 
   * Go online to github.com and issue a Pull Request for the change to be merged in
   
