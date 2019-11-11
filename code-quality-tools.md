Code Quality Tools
==================

Python:Radon [1]
Install Radon:
  pip install radon
Report cyclomatic complexity with average at the end and sorted by SCORE for all .py files:
  radon cc -s --total-average -o SCORE *
Report maintability index for all .py files:
  radon mi -s *
Report Halstead metrics for all .py files:
  radon hal *
Report Halstead metrics for all functions from all *.py files:
  radon hal -f *

Python:Wily [2]
Install Wily:
  pip install wily
Build an index (history) of you code (always do this first):
  wily build
Build an index (history) of you code for the last 200 commits (default 50):
  wily build -n 200
Simple report for a .py file:
  wily report run.py

Python:Flake8 [3]
Install Flake8:
  pip install flake8
Run lint for .py files:
  flake8 *.py


REFERENCES:
[1] - https://pypi.org/project/radon/
[2] - https://pypi.org/project/wily/
[3] - https://flake8.readthedocs.io/en/latest/
