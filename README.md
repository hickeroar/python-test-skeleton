# Python Test Skeleton
#### A simple code quality and unit testing skeleton using Coverage, Flake8, and the built in Python `unittest` module.

## Dependencies
* [Coverage](https://pypi.org/project/coverage/)
* [Flake8](https://pypi.org/project/flake8/)

## Installation/Initialization
* Clone this repository and `cd` into the cloned directory.
* Choose either one of these options:
  * Execute `./config/init.sh` to install everything needed as well as some additional helpers.
  * Run these commands to install everything manually:
    * `python -m venv venv`
    * `source venv/bin/activate`
    * `pip install --upgrade pip`
    * `pip install -r requirements.txt`
    * `deactivate`

## Usage
* From the root of the cloned directory, execute: `./test/test.sh`, which should output:
```
Running Unit Tests.
..
----------------------------------------------------------------------
Ran 2 tests in 0.000s

OK
Name                   Stmts   Miss  Cover   Missing
----------------------------------------------------
skeleton/__init__.py       0      0   100%
skeleton/addition.py       4      0   100%
----------------------------------------------------
TOTAL                      4      0   100%
Success: Tests Passed and Coverage is 100%.

Running Code Quality Tests (flake8).
Success: No code quality issues detected.
```

## Using with your own project
* You will need to update the `MODULE_DIR` variable in `test/test.sh` file to point to the correct module directory instead of `skeleton`.
  * If your project has multiple modules, you will need to update the `test/test.sh` file accordingly.
* The `test/` directory should be an exact mirror of the structure of your module's directory, as shown in the `skeleton` example module.
* Ensure you include the expected `__init__.py` files in all nested test directories, to enable the test runner to find all your tests.
