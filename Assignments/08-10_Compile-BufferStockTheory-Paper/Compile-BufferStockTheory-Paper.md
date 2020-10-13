
# Overview

The `BufferStockTheory` paper will serve as a template for your own paper for the course.

The script "Compile-BufferStockTheory-Paper.sh" has the steps needed to set this up

Briefly, the setup works as follows. In the `~/Papers` directory We will create a directory structure like this:

```
	/BST
	/BST/BST-Shared
	/BST/BST-Public
	/BST/BST-make
```

1. The `-Shared` directory will correspond to a 'private' GitHub repo
   * The idea of having a private repo ending `-Shared` is to share with coauthors
   * e.g., if `[paper]=BufferStockTheory` then `BufferStockTheory-Shared` is shared
1. You also want a 'public' version of the paper visible to anybody (not just coauthors)
   * Your public repo on GitHub should just be the name of the `[paper]`
   * e.g., the 'public' repo for the `BufferStockTheory` paper is just called
      [BufferStockTheory](https://github.com/llorracc/BufferStockTheory) on GitHub
   * But the directory containing it is called `BufferStockTheory-Public` on my local machine

# Create `BST-make`

1. In the `/home/methods` directory of your virtual machine:
    * Create a directory `Papers/BST`
1. Download the original, public version of my `BufferStockTheory-make` repo
   `cd ~/Papers/BST`
   `git clone https://github.com/ccarrollATjhuecon/BufferStockTheory-make.git`
1. Then rename it to `BST-make`:
   `mv BufferStockTheory-make BST-make`

# Create `BST-Shared`

   1. Download the original, public version of my `BufferStockTheory` Paper
   1. Detach it from my GitHub remote by removing the `.git` directory:
      `rm -Rf BufferStockTheory/.git`
   1. Then rename it to `BST-Shared`
      `mv BufferStockTheory BST-Shared`
   1. In your GitHub account, make a new empty `private repo` named `BST-Shared`
      * This will be the `remote` corresponding to your local `BST-Shared`
      * GitHub will give you a set of instructions to execute at the command line
   1. Add some 'private' content and push it upstream
      * Download the [Submit.tex](https://raw.githubusercontent.com/ccarrollATjhuecon/BufferStockTheory-Shared/master/Private/TheOnion/Submit.tex) file to the `Private/TheOnion` directory

# Create `BST-Public`

1. In your GitHub account, make a new empty `public repo` named `BST`
1. The script `makePublic.sh` strips out private stuff from what is in `BST-Shared` to create the contents of `BST-Public`
      * For example, the script strips out directories labeled `Private`
      * Like the one that contains the submission letter to a journal


# Test

All the steps above should be accomplished by the `Compile-BufferStockTheory-Paper.sh` script

After the script has finished, you should test whether the setup is working:

1. Install the `econ-ark` toolkit:
   `sudo conda install -c conda-forge econ-ark`

1. Confirm that the `makeEverything.sh` script inside the `-make` directory works:

   `./makeEverything.sh`

1. Change the name of the author of the paper to your own name, and `makeEverything` again

1. Update the `BST-Public` local directory with the script:
      `./makePublic.sh ~/Public/BST update`

1. Incorporate the changes via `postEverything.sh`
