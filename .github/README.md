# Termux Clipboard
[heading__top]:
  #termux-clipboard
  "&#x2B06; Integrate Vim '+' register with the Android system clipboard via Termux APIs"


Integrate Vim '+' register with the Android system clipboard via Termux APIs

## [![Byte size of Termux Clipboard][badge__main__termux_clipboard__source_code]][termux_clipboard__main__source_code] [![Open Issues][badge__issues__termux_clipboard]][issues__termux_clipboard] [![Open Pull Requests][badge__pull_requests__termux_clipboard]][pull_requests__termux_clipboard] [![Latest commits][badge__commits__termux_clipboard__main]][commits__termux_clipboard__main] [![License][badge__license]][branch__current__license]


---


- [:arrow_up: Top of Document][heading__top]
- [:building_construction: Requirements][heading__requirements]
- [:zap: Quick Start][heading__quick_start]
- [&#x1F9F0; Usage][heading__usage]
- [&#x1F5D2; Notes][heading__notes]
  - [Clipboard not accessible on non-root device when screen is off][heading__clipboard_not_accessible_on_nonroot_device_when_screen_is_off]
  - [Non-recursive Mappings][heading__nonrecursive_mappings]
- [:chart_with_upwards_trend: Contributing][heading__contributing]
  - [:trident: Forking][heading__forking]
- [:card_index: Attribution][heading__attribution]
- [:balance_scale: Licensing][heading__license]


---


## Requirements
[heading__requirements]:
  #requirements
  "&#x1F3D7; Prerequisites and/or dependencies that this project needs to function properly"


This repository requires the [Vim][vim_home] text editor to be installed the
source code is available on [GitHub -- `vim/vim`][vim__github], and most GNU
Linux package managers are able to install Vim directly, eg...


- Termux


   ```bash
   pkg install termux-api
   ```

> Note; installing without python support, eg. `pkg install vim`, _should_ also
> function fine instead for this plugin

Additionally the Termux API CLI must be installed within via;

   ```bash
   pkg install termux-api
   ```

... As well as the corresponding [API](https://wiki.termux.com/wiki/Termux:API)


______


## Quick Start
[heading__quick_start]:
  #quick-start
  "&#9889; Perhaps as easy as one, 2.0,..."


Clone this project...


**Termux**


```bash
mkdir -vp ~/git/hub/vim-utilities

cd ~/git/hub/vim-utilities

git clone git@github.com:vim-utilities/termux-clipboard.git
```


---


This repository is a Vim plugin, and can be installed by cloning to your plugin
directory, eg...


```bash
mkdir ~/.vim/plugin
cd ~/.vim/plugin
git clone git@github.com:vim-utilities/termux-clipboard.git
```


... or if cloned elsewhere, then symbolically link to your plugin directory...


```bash
ln -s "${HOME}/git/hub/vim-utilities/termux-clipboard"\
      "${HOME}/.vim/plugin/"
```


______


## Usage
[heading__usage]:
  #usage
  "&#x1F9F0; How to utilize this repository"



Just use `"+y`, `"+p`, `<C-R>+`, and friends as you always do. Specifically, here's what's supported:

- Any yank command that starts with `"+` (e.g. `"+yy` or `"+yiw`) in insert and visual modes.
- Pasting in normal and visual modes with `"+p` or `"+P`.
- Pasting in insert mode with `<C-R>+`, `<C-R><C-R>+`, `<C-R><C-O>+`, or `<C-R><C-P>+`.
- Yanking and pasting (`p` and `P` in normal and visual modes) with `clipboard=unnamedplus`.

If you need more functionality, consider checking out [vim-fakeclip](https://github.com/kana/vim-fakeclip).


______


## Notes
[heading__notes]:
  #notes
  "&#x1F5D2; Additional things to keep in mind when developing"


> This repository may not be feature complete and/or fully functional, Pull
> Requests that add features or fix bugs are certainly welcomed.


### Clipboard not accessible on non-root device when screen is off
[heading__clipboard_not_accessible_on_nonroot_device_when_screen_is_off]: #clipboard-not-accessible-on-nonroot-device-when-screen-is-off


:warning: Certain security choices of Android 10, related to accessibility
abuses and installation methods, it is **not** possible to yank/put from/to the
system clipboard when the device's screen is off!  And may not be possible if
the Termux application is not in the foreground.

For those using SSH the current best non-root workaround currently is to keep
the screen on and unlocked, and Termux in the foreground.


### Non-recursive Mappings
[heading__nonrecursive_mappings]: #nonrecursive-mappings


This plugin uses mappings of `"+p`, `<C-R>+`, `"+`, etc. to do its job. As a
result, it won't work with existing *non-recursive* mappings that run these
commands, e.g. `nnoremap <Leader>p "+p`. If you have mappings like these,
you'll need to use their recursive counterparts instead for the plugin to work.


______


## Contributing
[heading__contributing]:
  #contributing
  "&#x1F4C8; Options for contributing to termux-clipboard and vim-utilities"


Options for contributing to termux-clipboard and vim-utilities


---


### Forking
[heading__forking]:
  #forking
  "&#x1F531; Tips for forking termux-clipboard"


Start making a [Fork][termux_clipboard__fork_it] of this repository to an account that you have write permissions for.


- Add remote for fork URL. The URL syntax is _`git@github.com:<NAME>/<REPO>.git`_...


```bash
cd ~/git/hub/vim-utilities/termux-clipboard

git remote add fork git@github.com:<NAME>/termux-clipboard.git
```


- Commit your changes and push to your fork, eg. to fix an issue...


```bash
cd ~/git/hub/vim-utilities/termux-clipboard


git commit -F- <<'EOF'
:bug: Fixes #42 Issue


**Edits**


- `<SCRIPT-NAME>` script, fixes some bug reported in issue
EOF


git push fork main
```


> Note, the `-u` option may be used to set `fork` as the default remote, eg. _`git push -u fork main`_ however, this will also default the `fork` remote for pulling from too! Meaning that pulling updates from `origin` must be done explicitly, eg. _`git pull origin main`_


- Then on GitHub submit a Pull Request through the Web-UI, the URL syntax is _`https://github.com/<NAME>/<REPO>/pull/new/<BRANCH>`_


> Note; to decrease the chances of your Pull Request needing modifications before being accepted, please check the [dot-github](https://github.com/vim-utilities/.github) repository for detailed contributing guidelines.



______


## Attribution
[heading__attribution]:
  #attribution
  "&#x1F4C7; Resources that where helpful in building this project so far."


- [GitHub -- `github-utilities/make-readme`](https://github.com/github-utilities/make-readme)
- [GitHub -- `jasonccox/vim-wayland-clipboard`](https://github.com/jasonccox/vim-wayland-clipboard)


______


## License
[heading__license]:
  #license
  "&#x2696; Legal side of Open Source"


```
The MIT License (MIT)

Copyright (c) 2021 Jason Cox
Copyright (C) 2024 S0AndS0

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```


For further details review full length version of [MIT][branch__current__license] License.



[branch__current__license]:
  /LICENSE
  "&#x2696; Full length version of MIT License"

[badge__license]:
  https://img.shields.io/github/license/vim-utilities/termux-clipboard

[badge__commits__termux_clipboard__main]:
  https://img.shields.io/github/last-commit/vim-utilities/termux-clipboard/main.svg

[commits__termux_clipboard__main]:
  https://github.com/vim-utilities/termux-clipboard/commits/main
  "&#x1F4DD; History of changes on this branch"


[termux_clipboard__community]:
  https://github.com/vim-utilities/termux-clipboard/community
  "&#x1F331; Dedicated to functioning code"


[issues__termux_clipboard]:
  https://github.com/vim-utilities/termux-clipboard/issues
  "&#x2622; Search for and _bump_ existing issues or open new issues for project maintainer to address."

[termux_clipboard__fork_it]:
  https://github.com/vim-utilities/termux-clipboard/fork
  "&#x1F531; Fork it!"

[pull_requests__termux_clipboard]:
  https://github.com/vim-utilities/termux-clipboard/pulls
  "&#x1F3D7; Pull Request friendly, though please check the Community guidelines"

[termux_clipboard__main__source_code]:
  https://github.com/vim-utilities/termux-clipboard/
  "&#x2328; Project source!"

[badge__issues__termux_clipboard]:
  https://img.shields.io/github/issues/vim-utilities/termux-clipboard.svg

[badge__pull_requests__termux_clipboard]:
  https://img.shields.io/github/issues-pr/vim-utilities/termux-clipboard.svg

[badge__main__termux_clipboard__source_code]:
  https://img.shields.io/github/repo-size/vim-utilities/termux-clipboard




[vim__home]:
  https://www.vim.org
  "Home page for the Vim text editor"

[vim__github]:
  https://github.com/vim/vim
  "Source code for Vim on GitHub"






