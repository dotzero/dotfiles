#!/usr/bin/env python

"""
Dotfiles syncronization.
Makes symlinks for all files: ~/.0/tilde/zshrc => ~/.zshrc
Based on https://gist.github.com/490016
"""

import os
import glob
import shutil

SOURCE_DIR = '~/.0/tilde'
EXCLUDE = []
NO_DOT_PREFIX = []


def force_remove(path):
    if os.path.isdir(path) and not os.path.islink(path):
        shutil.rmtree(path, False)
    else:
        os.unlink(path)


def is_link_to(link, dest):
    is_link = os.path.islink(link)
    is_link = is_link and os.readlink(link).rstrip('/') == dest.rstrip('/')
    return is_link


def main():
    os.chdir(os.path.expanduser(SOURCE_DIR))
    for filename in [file for file in glob.glob('*') if file not in EXCLUDE]:
        dotfile = filename
        if filename not in NO_DOT_PREFIX:
            dotfile = '.' + dotfile
        dotfile = os.path.join(os.path.expanduser('~'), dotfile)
        source = os.path.join(SOURCE_DIR, filename).replace('~', '.')

        # Check that we aren't overwriting anything
        if os.path.lexists(dotfile):
            if is_link_to(dotfile, source):
                continue

            response = input("Overwrite file `%s'? [y/N] " % dotfile)
            if not response.lower().startswith('y'):
                print("Skipping `%s`..." % dotfile)
                continue

            force_remove(dotfile)

        os.symlink(source, dotfile)
        print("%s => %s" % (dotfile, source))


if __name__ == '__main__':
    main()
