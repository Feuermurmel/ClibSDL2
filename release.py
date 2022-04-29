#! /usr/bin/env python3

import argparse
import os
import sys
from pathlib import Path
from subprocess import check_output, check_call, call, CalledProcessError


class UserError(Exception):
    pass


def log(message):
    print(message, file=sys.stderr, flush=True)


def parse_args():
    parser = argparse.ArgumentParser()
    parser.add_argument('version')

    return parser.parse_args()


def main(version):
    os.chdir(Path(__file__).parent)

    current_branch = check_output(['git', 'branch', '--show-current']).strip()
    current_rev = check_output(['git', 'rev-parse', 'HEAD']).strip()

    if call(['git', 'diff', '--stat', '--exit-code', 'HEAD']):
        raise UserError('Working tree has uncommitted changes.')

    check_call(['git', 'checkout', current_rev])

    try:
        check_call(['make', 'clean'])
        check_call(['make', '-j', f'{os.cpu_count()}', 'all'])
        check_call(['git', 'add', 'Frameworks'])
        check_call(['git', 'commit', '-m', f'Release {version}'])
        check_call(['git', 'tag', version])
    finally:
        check_call(['git', 'checkout', current_branch or current_rev])

    input(f'Press return to push tag {version} to origin. ')
    check_call(['git', 'push', 'origin', f'{version}'])


try:
    main(**vars(parse_args()))
except KeyboardInterrupt:
    log('Operation interrupted.')
    sys.exit(1)
except (UserError, CalledProcessError) as e:
    log(f'error: {e}')
    sys.exit(2)
