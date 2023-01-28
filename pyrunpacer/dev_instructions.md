# Dev Instructions

Using this project to go through the [Python Packages Book](https://py-pkgs.org/).

## Install non-dev dependency / system tools

1. poetry
  - Arch: `pacman -Sy python-poetry`
2. cookiecutter
  - Arch: `pacman -Sy python-cookiecutter`

## Setup and initiate the python package

1. `cookiecutter https://github.com/py-pkgs/py-pkgs-cookiecutter.git`

```
$ cookiecutter https://github.com/py-pkgs/py-pkgs-cookiecutter.git
You've downloaded /home/dan/.cookiecutters/py-pkgs-cookiecutter before. Is it okay to delete and re-download it? [yes]: yes
author_name [Monty Python]: Daniel Chen
package_name [mypkg]: pyrunpacer
package_short_description [A package for doing great things!]: Help convert between paces and speed in miles and km.
package_version [0.1.0]:
python_version [3.9]: 3.7
Select open_source_license:
1 - MIT
2 - Apache License 2.0
3 - GNU General Public License v3.0
4 - CC0 v1.0 Universal
5 - BSD 3-Clause
6 - Proprietary
7 - None
Choose from 1, 2, 3, 4, 5, 6, 7 [1]: 1
Select include_github_actions:
1 - no
2 - ci
3 - ci+cd
Choose from 1, 2, 3 [1]: 3
```

2. Commented out the `on` trigger for the `.github/workflows/ci-cd.yml` file (will deal with CI+CD later)
