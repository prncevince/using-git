# This script sets up everything
# Make sure to edit git@url below

# checkout theme's master branch
cd theme && git checkout master && cd ..

# add new remote
git remote remove origin
git remote add origin git@esgovcloud.com:mAndA/mod-mAndA-5-vc-git.git

# create new git history
git checkout --orphan temp_branch
git add .
git commit -am "Create presentaton message"
git branch -D master
git branch -m master

# break gitlink in gh-pages branch
git checkout -b gh-pages
git rm .gitmodules
git commit -m "Remove gitlink to theme submodule"
git checkout master

# setupstream branch branch
git push -u origin master
