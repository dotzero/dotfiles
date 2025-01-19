#!/bin/bash

# Duti requires you to use an know application's _bundle id_
# in order to set it as the default for a given document type.
# Use the following command to list all known ids for your system.
# > lsappinfo | grep 'bundleID="' | cut -d'"' -f2 | sort

duti -s dev.zed.Zed .c all
duti -s dev.zed.Zed .cpp all
duti -s dev.zed.Zed .cs all
duti -s dev.zed.Zed .css all
duti -s dev.zed.Zed .go all
duti -s dev.zed.Zed .java all
duti -s dev.zed.Zed .js all
duti -s dev.zed.Zed .sass all
duti -s dev.zed.Zed .scss all
duti -s dev.zed.Zed .less all
duti -s dev.zed.Zed .vue all
duti -s dev.zed.Zed .cfg all
duti -s dev.zed.Zed .json all
duti -s dev.zed.Zed .jsx all
duti -s dev.zed.Zed .lua all
duti -s dev.zed.Zed .md all
duti -s dev.zed.Zed .php all
duti -s dev.zed.Zed .pl all
duti -s dev.zed.Zed .py all
duti -s dev.zed.Zed .rb all
duti -s dev.zed.Zed .rs all
duti -s dev.zed.Zed .sh all
duti -s dev.zed.Zed .swift all
duti -s dev.zed.Zed .txt all
duti -s dev.zed.Zed .conf all
