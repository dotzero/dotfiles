#!/usr/bin/env python3

import os
import glob
import shutil

MAP = {'~/.0/tilde': '~', '~/.0/.config':'~/.config'}
EXCLUDE = []
NO_DOT_PREFIX = ['topgrade.toml']


def force_remove(path):
    if os.path.isdir(path) and not os.path.islink(path):
        shutil.rmtree(path, False)
    else:
        os.unlink(path)


def is_link_to(link, dest):
    is_link = os.path.islink(link)
    is_link = is_link and os.readlink(link).rstrip('/') == dest.rstrip('/')
    return is_link


def link(source, target):
    os.chdir(os.path.expanduser(source))
    for filename in [file for file in glob.glob('*') if file not in EXCLUDE]:
        dotfile = filename
        if filename not in NO_DOT_PREFIX:
            dotfile = '.' + dotfile

        source_file = os.path.join(os.path.expanduser(source), filename)
        target_file = os.path.join(os.path.expanduser(target), dotfile)

        # Check that we aren't overwriting anything
        if os.path.lexists(target_file):
            if is_link_to(target_file, source_file):
                continue

            response = input("Overwrite file `%s'? [y/N] " % target_file)
            if not response.lower().startswith('y'):
                print("Skipping `%s`..." % target_file)
                continue

            force_remove(target_file)

        os.symlink(source_file, target_file)
        print("%s => %s" % (target_file, source_file))


def main():
    for key in MAP:
        link(key, MAP[key])


if __name__ == '__main__':
    main()
