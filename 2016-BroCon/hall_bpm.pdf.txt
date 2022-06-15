Bro Package Manager

Why aren't scripts being shared?
· Secret techniques? · Organizational momentum against sharing? · Difficulty in making scripts generally applicable? · Difficulty in discovery and installation?
We can solve this one!

Thanks!

What's the idea?
· Like Python's pip or Ruby gems · Make it easy to connect script authors with script users · Foster an ecosystem of shared scripts to improve everyone
· Nice side effect of making life a tiny bit hard on attackers

Design and Architecture
· Python library with a command line frontend · Centralized package repository but possible to configure others · Low friction for contributions · Not packages with Bro or tied to Bro's release schedule

¯\_()_/¯
Requirement: Bro 2.5

Installation

Instpailplaitnisotnall bro-pkg

Configuration

If "bro" isn't in your path, first do.....
$ export PATH=/opt/bro/bin/:$PATH

Then...
$ mkdir -p ~/.bro-pkg

You are configuring a user account to use
bro-pkg!

$ bro-pkg autoconfig > ~/.bro-pkg/config

You might have permissions trouble!
[user@server ~]$ bro-pkg install ssn-exposure OSError: [Errno 13] Permission denied: '/usr/local/bro/share/bro/site/ packages' error: user does not have write access in /usr/local/bro/share/bro/site error: user does not have write access in /usr/local/bro/lib/bro/plugins
This happened because it's installing into your installed Bro directories

Loading scripts

@load packages

Add that to local.bro or load it from the command line

Package list
[user@server ~]$ bro-pkg list all bro/broala/bro-long-connections (installed) bro/jsiwek/bro-test-package bro/sethhall/credit-card-exposure (installed) bro/sethhall/ssn-exposure (installed)

Searching
[user@server ~]$ bro-pkg search dlp bro/sethhall/credit-card-exposure
tags: file analysis, credit card, cc, dlp, data loss bro/sethhall/ssn-exposure
tags: file analysis, social security number, ssn, dlp, data loss

Some other commands
If a package causes trouble, remove it! [user@server ~]$ bro-pkg remove ssn-exposure removed "ssn-exposure"
Maybe you just want to unload it [seth@Blake tmp]$ bro-pkg unload ssn-exposure unloaded "ssn-exposure"
Update packages [user@server ~]$ bro-pkg upgrade --all

Making Packages
· Packages are just git repositories · Only need a single file to describe the package (bro-pkg.meta)
· And it's a simple file!
Let's go make one!

Create a repository

Add a bro-pkg.meta

Fork the packages repository

Add it to the main package repo

Submit a pull request
And get it merged!

Future Directions
· Dependencies · Testing and linting infrastructure · More automation on the backend for managing the packages repo · More packages!

http://bro-package-manager.readthedocs.io

