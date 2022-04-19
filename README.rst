.. contents::

=====
About
=====

my dotfiles

============
Installation
============

I used `this dotfiles tool <https://github.com/jbernard/dotfiles>`_ to manage the files, you can just use whatever you like.


============
Misc
============

***
git
***

Some of the useful git shortcuts


:git new: will start a new branch and push it to remote
:git reset-master: prints commands you can use to reset your master to upstream master
:git cm: git checkout to default branch
:git uncommit: will undo last commit

My typical workflow:

.. code-block:: bash

    git stash # if needed
    git cm
    git pull upstream HEAD
    git new new-branch
    

***
vim
***

:F2: toggle paste
:F5: execute
:F6: highlight whitespaces
:F7: wrap long lines
