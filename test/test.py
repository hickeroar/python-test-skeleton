#!/usr/bin/env python3
import os
import sys
import unittest

sys.path.append(os.path.dirname(os.path.dirname(os.path.abspath(__file__)) + '..'))

if __name__ == '__main__':
    loader = unittest.TestLoader()

    tests = loader.discover(
        'test',
        pattern='*.py'
    )
    runner = unittest.TextTestRunner()
    result = runner.run(tests)

    if not result.wasSuccessful():
        exit(1)
