#!/bin/bash

if [ "$(git config --global user.name)" == "" ]; then
    echo 'Before running this script you must configure your git user name and email.'
    echo ''
    echo 'For example, for the ccarrollATjhuecon GitHubID the configuration is:'
    echo 'git config --global user.name "ccarrollATjhuecon"'
    echo 'git config --global user.email "git@jhuecon.org"'
    echo '' ; echo 'Once this is done, rerun this script'
    exit
fi

if [ "$(ssh -oStrictHostKeyChecking=no -T git@github.com)" == *"Permission denied"* ]; then
    echo 'Before running this script you must upload your ssh key to your GitHub account.'
    echo 'See https://help.github.com/en/articles/adding-a-new-ssh-key-to-your-github-account'
    echo '' ; echo 'Once this is done, rerun this script'
    exit
fi

if [ -d ~/Papers/BST ]; then
    echo 'Before running this script, please execute the command:'
    echo ''
    echo 'rm -Rf ~/Papers/BST'
    echo '' ; echo 'Once this is done, rerun this script'
    exit
fi

if [ -d ~/Papers/BST ]; then
    echo 'Before running this script, please execute the command:'
    echo ''
    echo 'rm -Rf ~/Papers/BST'
    echo '' ; echo 'Once this is done, rerun this script'
    exit
fi

# Configure git so that it (temporarily) remembers usernames and passwords

git config --global credential.helper cache
git config --global credential.helper 'cache --timeout=3600'

username="$(git config --global user.name)"

# Uncomment, change appropriately, and execute the lines below

# Define shell variables 
newDir=BST                # New name for our project 
oldDir=BufferStockTheory  # Original name for our project 
paper=BufferStockTheory   # Name of the paper
root=~/Papers/"$newDir"   # Location of root directory

# Create the root directory
mkdir -p "$root"
cd       "$root"

# Get the original -make repo
git clone https://github.com/ccarrollATjhuecon/"$oldDir"-make.git
mv "$oldDir"-make "$newDir"-make

# Get the original public repo 
git clone https://github.com/llorracc/"$oldDir".git

# Detach the local repo from git 
rm -Rf "$oldDir"/.git

# Use the former "-Public" repo as the basis for the new "Shared" version of the paper
mv "$oldDir" "$newDir"-Shared
cd "$root"/"$newDir"-Shared

# Create a remote private GitHub directory and connect the local directory to it
echo 'Now login to GitHub and create BST-Shared as a new private remote repo ; hit return when done'
read answer
git init
git add README.md
git commit -m "first commit"
git remote add origin git@github.com:"$username"/"$newDir"-Shared.git
git add .
git commit -m 'Add BST files'
git push -u origin master

# Add a private directory containing a submission letter

mkdir -p "$root"/"$newDir-Shared"/Private/TheOnion ; cd "$root"/"$newDir-Shared"/Private/TheOnion 
curl -L https://raw.githubusercontent.com/ccarrollATjhuecon/"$oldDir"-Shared/master/Private/TheOnion/Submit.tex > Submit.tex
cd "$root"/"$newDir-Shared"
git add .
git commit -m 'Add Onion submission letter'

# Add some private text to the paper
cd "$root"/"$newDir-Shared"
echo '\begin{Private}' >> "$oldDir".tex
echo 'This is a private environment that will be removed from the public repo' >> "$oldDir".tex
echo '\end{Private}' >> "$oldDir".tex
echo '' >> "$oldDir".tex
echo '%Msg This is a private message that will be removed from the public repo' >> "$oldDir".tex
echo '%% This is a private comment that will be removed from the public repo' >> "$oldDir".tex

# Create the "public" version of the paper by copying the public content from the "Shared" version

cd "$root"/"$newDir"-make
./makePublic.sh "$root" create
cd "$root"/"$newDir-Public"

# Connect it to a remote public repo
echo 'Now in GitHub create BST as a public remote repo ; hit return when done'
read answer
git init
git add .
git commit -m 'Add generated Public content'
git remote add origin git@github.com:"$username"/"$newDir".git
git push -u origin master

# Detect the differences between the Shared and the Public texts
diff "$root"/"$newDir"-Shared/"$paper.tex" "$root"/"$newDir"-Public/"$paper.tex"

# Make a modification that should go in both Shared and Public versions

cd "$root"/"$newDir-Shared"

# Add a line at the beginning of the file
sed -i.bak '1 s/^/% Modified for JHU Class\n/' BufferStockTheory.tex
# Remove the backup file that was created by the preceding command
rm -f *.bak

cd "$root"/"$newDir-make"
./makePublic.sh "$root" update

# Ask user to update remotes
./postEverything.sh

