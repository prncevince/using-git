# Version Control - Using Git

5th presentation in the Modernizing the M&A Workflow series.

https://esgovcloud.com/pages/mAndA/mod-mAndA-5-vc-git

To collab & contribute to the presentation, see [CONTRIBUTING](CONTRIBUTING.md)

## Description

The slides are an intro to setting up and using version control (Git) within the M&A data analysis & software development environments.

## Itinerary

- Preface
    - You will mess up
        - It's okay to mess up
            - ... git is stupid
    - `man git`:
        > GIT(1) &nbsp;&nbsp;&nbsp;&nbsp; Git Manual &nbsp;&nbsp;&nbsp;&nbsp; GIT(1)<br>
        **NAME**
            git - the stupid content tracker
- Getting setup with Git
    - Unix Terminal Emulator (Standing up Development Environment)
    - Git Config username / email
- SSH Key setup
    - Generating Keys
    - SSH Config
- Initializing a repo
    - Adding local git Git Config
    - Adding a remote repository
    - Cloning - Starting from scratch
- R Project + RStudio + Git setup
- Concepts
    - [3 trees](https://www.atlassian.com/git/tutorials/undoing-changes/git-reset)
    - `git init`
    - `git add`
    - `git commit`
    - `git push`
    - `git pull`
        - `git fetch`
        - `git merge`
    - `git reset`
    - `git revert`
    - `git tag`
    - large file storage
- Demo project w/ common tools for different types of R projects
    - R Project
    - renv
    - lintr & stylr
    - doc-toc
    - npm scripts (don't even need a Node.js project)
