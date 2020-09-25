# My ~/.emacs.d setup

This is my configuration for GNU *emacs* and related usage notes. This setup is tailored for Python, C++ and some Javascript development. Currently, the master branch contains settings intended for GNU *emacs* major version 27.

# Using this repository

*So what can I do with this repo?*

If you want to setup *emacs* for C, C++, Python, or Javascript development-- then you may want to start with this setup. You can continue to configure it to meet your needs as you go. To do this:

1. Fork this repository into your own github account. To fork this repository, see: <https://help.github.com/en/github/getting-started-with-github/fork-a-repo>. Optionally, you may want to create a template from that forked repository that everyone in your organization can use, see: <https://help.github.com/en/github/creating-cloning-and-archiving-repositories/creating-a-repository-from-a-template>.

2. Next, you should clone your new repository to every machine where you use *emacs*. When you clone it, clone it to your *emacs.d* settings directory. On Linux, this is in your home directory at: *~/.emacs.d*:

    ```bash
    # goto home directory
    cd ~/
    # move your old emacs settings, if any-- out of the way
    mv ~/.emacs.d ~/.emacs.d.old
    # clone your new settings directory
    git clone git@github.com:YOURGITHUBUSERHERE/emacssetup.git ~/.emacs.d/
    ```
    This allows you to have one setup for all machines that run a compatible version of *emacs*, and to keep that setup synchronized.

3. Start *emacs*.

    ```bash
    $ emacs
    ```
    When you first start *emacs* after cloning, you may get errors reported in the terminal window. This is because the settings you have cloned from *git* reference packages that have not been installed yet. We will fix this in the next step by installing the missing packages.

4. List your installed packages:
    * **M-x list-packages:** This shows the packages available. Press 'r' to reload available packages from the configured repositories (melpa).
    * **M-x package-install-selected-packages:** installs all packages listed in our *.emacs.d/init.el* file, in section *package-selected-packages*.

    Note that it may appear that *emacs* has hung when you run *M-x package-install-selected-packages*. You may see a message in the mini-buffer that states: *"Contacting Melpa..."*. You are especially likely to see this if you have a slow connection. *emacs* probably isn't hung, but just busy. If you look in directory *~/.emacs.d/elpha/*, you will see that packages are appearing as they are downloaded. If you restart *emacs* before it finishes downloading a large package-- then it will loose track of the current package and you will just end up having to download it again later.

5. When all packages are installed, exit *emacs* and restart it. If you are running *emacs* in *daemon mode*, kill the dameon: `killall emacs` and then restart. You should no longer see startup errors in the terminal.

## Using your settings across multiple machines

Since this is a *git* repository, it is easy to use across multiple machines, you just clone it to every machine where you use *emacs*. Occasionally, you may have issues with one machines version of *emacs*.  If you cannot modify your setup such that it works everywhere, then create a branch for each setup you need.

A good example of this would be creating a branch for each major version of *emacs*: an emacs 26 branch, a 25 branch, etc. Then you just clone the repo and checkout the branch matching your version.

## Committing Changes

*Don't forget to commit and push your changes back to your repository.*

Note that *emacs* can interactively change the contents of your *~/emacs.d/init.el* file as it saves updates you have requested. *emacs* does this when you use drop-down menu options to change settings or when you install new packages. You should make sure you are done making such changes before you attempt to commit your changes with git. To commit changes, you can either use *git* on the command line, or you can use *magit* inside *emacs*. *magit* is a powerful *emacs* integration layer that is worth learning, and basic usage is fairy intuitive.

# Layout

The *emacs.d* directory has several setup files. At the top level, the *init.el* file contains only the most generic of *emacs* settings. In our setup, it's main purpose is to require other settings files, which live under the *custom* subdirectory. This lets us break out portions of setup code into bite-sized and purpose specific pieces, instead of having everything inside one large file.

The following list shows each settings file and a brief description of what it does:
* **init.el:** Main configuration entry point. Sets the package repository (melpa). Specifies required packages and custom setup files that must be loaded.
* **custom/setup-general.el:** Contains generic display setup. Examples of such would be: match parenthesis, don't show the tool bar, display the time, set the time zone, etc.
* **custom/setup-editing.el:** Contains generic file editing setup that is not specific to a mode or *emacs* subsystem.
* **custom/setup-git.el:** Contains setup information specific to git and github.
* **custom/setup-helm.el:** Contains setup instructions specific to helm. Helm is an alternate incremental completion framework that replaces the default tab completion. See https://github.com/emacs-helm/helm or the helm package section below.
* **custom/setup-c.el:** Contains setup specific to C/C++ projects and files.
* **custom/setup-python.el:** Contains setup specific to Python projects and files.
* **custom/setup-javascript.el:** Contains setup specific to Javascript projects and files.

If you don't need a portion of this setup, simply remove the setup-{item).el file and remove its require statement from the *init.el* file. You should also add your own stuff. For example, to support another language such as Go you could add file: *setup-go.el*.

# Packages installed

There are many options and packages available in modern *emacs*. It is dizzying. Many compete with each other to do similar tasks, but in different ways. These packages will often conflict with each other. It is best to install and use one new thing at a time. Learn what it can do for you and make sure it is not causing any issues before installing the next package. It is a trial and error process.

Below I describe the packages currently used in this setup and where you can go to get more information about them.

## company & company-box
**company** is a text auto-completion framework for *emacs*. *company* provides a pluggable search framework for auto-complete results. See: <https://company-mode.github.io/>.

**company-box** Extends company to support the display of icons in-line with text results. See: <https://github.com/sebastiencs/company-box>.

## async

**async** supports running code asyncronously, which lets elisp cooperatively switch between running processes whenever a process blocks on I/O. This is similar to Node.js or Python asyncio. See: <https://github.com/jwiegley/emacs-async>.

## window-numbering

Allows us to simply switch between windows in a frame with *M-#*, where number is the number of the window from top to bottom, left to right. See: <http://nschum.de/src/emacs/window-numbering-mode/>. This is much faster than using *C-x o* repeatedly.

## helm & helm-swoop

**helm** is an advanced completion engine for *emacs* that allows you to narrow results from provided lists. It extends and replaces the default tab completion that comes out of the box with *emacs*. It compliments *company* in that they really do different things.

<https://emacs-helm.github.io/helm/>

Other options exist as well, like ido and ivy/counsel.

**helm-swoop** uses helm to display matching content in another buffer. See <https://github.com/emacsorphanage/helm-swoop> and <https://www.emacswiki.org/emacs/HelmSwoop>. This is a helper package used by other packages and specific configurations.

## projectile & helm-projectile

**projectile** is an *emacs* package that adds project management support. This is similar to how monolithic IDE's provide their
own (often IDE specific) project file format (or use something like *Maven*).  Projectile includes support for automatic refactoring of code and movement between files within projects.  It is programming language and tool agnostic and attempts to recognize projects of different types created by different tools. Frequently support for specific project types is added via the use of tool specific packages and extensions.

See: <https://docs.projectile.mx/en/latest/>

**helm-projectile** is an *emacs* package that extends projectile to use helm completion. See <https://github.com/bbatsov/helm-projectile>.

## whitespace ws-butler or whitespace-cleanup-mode

I use two different packages that can get rid of bad white-space.

1. **ws-bulter:** The enabled default. This is a gentler program that only cleans up whitespace in the area you have modified. Everyone else's strange whitespacing is
   left alone. This is the default enabled in most editing and programming modes. See: <https://github.com/lewang/ws-butler>.

2. **whitespace-cleanup-mode:** This nukes all erroneous whitespace in the file everytime you save to disk. It is not on by default, but just installed. See: <https://github.com/purcell/whitespace-cleanup-mode>.

Which one to use?

If you are working on legacy code with others, you should probably use *ws-butler*. Using *whitespace-cleanup-mode* will result in huge commit sizes
that have nothing to do with your change. This occurs since you will have reformatted the entire file every-time you save. If you are on greenfield development
it should not matter as much-- *ws-bulter* will keep you safe to begin with. If you are refactoring or cleaning up code, then *whitespace-cleanup-mode* may be a better
choice since it lets you aggressively fix bad whitespace.

You can manually start *whitespace-cleanup-mode* on any buffer via *M-x whitespace-cleanup-mode*. You can set it up to be always on instead of *ws-bulter* by
editing *~/emacs.d/custom/setup-editing.el* and removing the lines commenting out *global-whitespace-cleanup-mode*. You should also comment out *ws-butler* at the
same time (you really only want one running at a time).

## volatile-highlights

**volatile-highlights** briefly shows us text that has been altered or pasted in. The text will appear highlighted until the next keystroke. This provides a tiny bit more visual context to what we have done. See: <https://www.emacswiki.org/emacs/VolatileHighlights>.

## undo-tree

**undo-tree** makes *emacs* undo features behave a bit more like *vim*. Instead of a linear undo, we can see a tree of changes and move between those changes. See <http://www.dr-qubit.org/emacs.php> and <https://www.emacswiki.org/emacs/UndoTree>.

## yasnippet

**yasnippet** is an abbreviation template system for *emacs*. We create a setup file with abbreviations and their expanded equivalents. When we type the abbreviation, we can optionally expand it to the full equivalent text. See: <https://www.emacswiki.org/emacs/Yasnippet> & <http://github.com/joaotavora/yasnippet>.

## anzu

**anzu** is a minor-mode that displays the current match and the number of total matches in the mode-line whenever a search is occurring. See: <https://github.com/emacsorphanage/anzu>.

## iedit
**iedit** Let's you edit multiple matching targets simultaneously. See: <https://github.com/victorhge/iedit>.

## markdown mode

Provides the ability to edit markdown files and see the output of files edited. See: <https://www.emacswiki.org/emacs/MarkdownMode>

## flyspell & flyspell-correct

Provides spell-checking as you go. See: <https://github.com/d12frosted/flyspell-correct>.

## lsp-mode, lsp-ui & ccls

**lsp-mode** enables the language server protocol support for *emacs*. This allows code completion and syntax highlighting for multiple programming languages. Unlike other tagging solutions, this one scales well and is relatively fast. It lets us integrate with third-party services, servers and interfaces to investigate our code.  See: <https://github.com/emacs-lsp/lsp-mode>.

**lsp-ui** Part of lsp-mode. Contains ui features to display results. See: <https://github.com/emacs-lsp/lsp-ui>

**ccls** is an emacs mode that runs the ccls server (you must have this installed along with clang). This provides lsp data for C/C++ & Objective C. See: <https://github.com/MaskRay/emacs-ccls>.

If you want to use lsp-mode with Python, you will need a python language back-end, such as the python-language-server. You can install this in your python environment with pip:

```bash
pip install python-language-server
```

## magit

A full *git* layer for integration of git with emacs. This is very handy and very well done. See: <https://magit.vc/manual/magit/Getting-Started.html#Getting-Started>.

## git-gutter

Keeps track of changes to our git version controlled files in a small "gutter" window on the left of the buffer. See: <https://github.com/emacsorphanage/git-gutter>.

## git-timemachine

Lets us navigate and interactively view the versions of a git controlled file. See: <https://github.com/emacsmirror/git-timemachine>.

## Python support via elpy

This package provides advanced Python specific IDE abilities and greatly enhances the Python programming experience inside *emacs*. See: <https://elpy.readthedocs.io/en/latest/introduction.html>

### Python pip packages to install autopep8, yapf, jedi, rope, black, flake8

These pip packages provide features used by elpy.

*autopep8* helps elpy enforce compliance with the Python Pep-8 coding standards by underlining in red all non-compliant code. See: <http://paetzke.me/project/py-autopep8.el>.
*flake8* is the linter static analysis engine used by autopep8.

To install all python packages needed by Elpy:

```bash
pip install autopep8 jedi rope yapf black flake8 pydocstyle
```

Sometimes, you may want to override some pep8 style settings, such as the default line length being set to only allow 80 characters.
To do this, edit *$HOME/.config/pycodestyle* and add the appropriate ini-file style configuration settings. Such as:

```
[pycodestyle]
max_line_length = 165
ignore = E501
```

To make sure elpy is running correctly, *M-X elpy-config*. Note any *warnings* or missing packages and install them.

If you are using a dedicated virtual environment per project, elpy may warn
about *~/.local/bin* not being in the PATH. You will have to either: modify your PATH
variable before starting emacs, or stop running emacs from the virtual
environment.

To modify your path, add a line like the following to your *~/.bashrc*:

```bash
export PATH="$PATH:$HOME/.local/bin"
```
## Javascript and json support via tide and JSX
*emacs 27* provides native support for react and typescript via *JSX*.

The *tide* package further extends this support. See <http://github.com/ananthakumaran/tide>.

# General emacs Environment Setup

What follows are instructions that I use to setup *emacs* in a GNU/Linux environment. These settings are not specfic to anything found in this repository.

I set up *emacs* to be the default editor in my *bash* shell environment. I do this by adding the following to file *~/.bashrc*:

```bash
export VISUAL='emacsclient -c --alternate-editor='
export EDITOR='emacsclient -t --alternate-editor='
alias e="${VISUAL}"
```

I like to run *emacs* in daemon mode (as a server). This is a better way to run *emacs* on modern systems, since it shares resources with other windowed instances of *emacs*. This allows each client instance to integrate with the others, instead of having single instances that can clober over the same files.

By default, *emacsclient* starts a new client that connects to the existing emacs daemon running in the background. The "--alternate-editor=" syntax is awkward, but it essentially means start up a new *emacs daemon* if the client could not connect to an existing one. Note that if you put an argument after the *=*, the behavior changes. When the deamon isn't already running *emacsclient* would then instead try to start the specified editor as a backup option. For example: *--alternate-editor=/usr/bin/nano* would try to connect to an *emacs daemon* and if that failed, it would start the nano editor and a new *emacs daemon* would not be started.

At this point, I use the *VISUAL* variable for editors running in *X* or *wayland* and *EDITOR* for editors running inside a terminal. This is not really what they were originally intended for, but that usage is archaic for most users anyway (unless you have a 300 baud modem and a printer instead of a display screen). You should understand what these two variables mean to other UNIX era legacy programs before you decide to mimic this setup, or you may run into minor issues.

We are passing *-t* to run a terminal version when EDITOR is used by some other program. This starts a new *emacs* client inside the terminal window.

When *VISUAL* is used, we create a new X window (actually, a *frame* in *emacs* parlance) via the *-c* option. Without this, *emacs* would try and find an existing X window and change the contents of that window. I prefer to have a new window (er... frame) for everything I explicitly open.

Note that these commands and options are specific to recent versions of *emacs*. Older versions of *emacs* and *emacsclient* take different options. Older versions of *emacs* don't even have an *emacsclient*, and some older versions give it a different name.

## clang setup

In order to use C++ features of ccls and lsp-mode, you will need to have *clang* and *ccls* installed. You can do this in Ubuntu/Debian distributions by installing packages *clang* and *ccls*:

```bash
sudo apt-get install clang ccls
```

## Systemd integration

You may take your setup one step further and have your emacs daemon managed by *systemd*, so that it starts up automatically when the machine starts. Instructions to do so are here: <https://nilsdeppe.com/posts/emacs-c++-ide2>. I don't do this as it seems overkill for my use case.

# Tutorials & Resources

If you are new to *emacs* you may want to read some tutorials before copying a setup. A good place to start is reading the official GNU manual for *emacs*. You can do this on your local machine using the *info* command, or you can read the online manual: <https://www.gnu.org/software/emacs/manual/>.

Many other resources are available as well. Some notable resources:

* <https://www.emacswiki.org/>
* <http://ergoemacs.org/>
* <https://www.reddit.com/r/emacs/>

C++ setup resources:

* <http://tuhdo.github.io/c-ide.html>
* <https://nilsdeppe.com/posts/emacs-c++-ide2>
* <https://www.sandeepnambiar.com/setting-up-emacs-for-c++/>
* <https://trivialfis.github.io/emacs/2017/08/02/C-C++-Development-Environment-on-Emacs.html>


Python setup resources:

* <https://elpy.readthedocs.io/>


Javascript setup resources:

* <https://patrickskiba.com/emacs/2019/09/07/emacs-for-react-dev.html>
* <http://wikemacs.org/wiki/JavaScript>

Much of this setup has been taken from these sources and modified for my specific use.

## Pre-configured emacs distributions

There are modified distributions of *emacs* that are purpose specific and configured "out-of-the-box". They won't work with this setup since they provide their own pre-rolled packages and settings. You may wish to consider using one of them.

**Spacemacs** is geared to *emacs* beginners with *vi/vim* experience:

* <https://www.spacemacs.org/>

**Doom-emacs** is geared to more experienced power users who want a leaner experience than spacemacs:

* <https://github.com/hlissner/doom-emacs>

**Prelude** is a distribution of *emacs* geared towards simplicity and
reliability. It is more conservative and closer to *emacs*, but with packages
setup to work in most languages:

* <https://prelude.emacsredux.com/en/latest>

# How to build your own emacs

Sometimes, the distributions version of *emacs* is not up to par. Below are my brief notes for building your own *emacs*. You will need the source code to the version of *emacs* that you wish to build.

## Building emacs 26 On Ubuntu LTS (and similar):

```bash
# add sources repos in /etc/apt/sources.list by uncommenting srcs repositories matching the binary equivalents.
sudo apt-get update
sudo apt-get build-dep emacs
sudo apt-get install libgtk-3-dev libwebkit2gtk-4.0-dev libjansson-dev libjansson4
# change the prefix to be whereever you wish. Your local home directory if you want.
./configure --with-modules --with-cairo --with-xwidgets --with-x-toolkit=gtk3 --with-mailutils --with-imagemagick --prefix=/usr/local
make -j
sudo make install prefix=/usr/local
```

# Keyboard setup, Kenesis Advantage II emacs setup

This sections contains configuration notes specific to the Advantage II keyboard.

Note that the Keyboard manual is found here:

<https://kinesis-ergo.com/wp-content/uploads/Adv2-Users-Manual-fw1.0.517-4-24-20.pdf>

## What is the Keypad layer?

The *kp* prefix used below indicates that we are referring to the keypad layer of the Advantage II keyboard.

What does *keypad layer* mean?

Well, a layer you have used on any keyboard is the *shift* layer. The shift key temporarily enters this layer while held down. The capslock toggles turning it off and on-- without having to keep holding down the shift key. Obviously, the shift layer makes the keys print capitals instead of lower case and symbols instead of numbers. Similarly, the number lock key locks the 10 key to emit numbers.

In the case of the keypad layer, the *keypd* button at the top right triggers this separate mode. It is used out of the box to let you ten key. Like most laptop keyboards, the keyboard doesn't have a physically separate keypad for 10 key.  The keypad layer turns the keys on the rightmost side of the keyboard into a 10 key. So key *u* on a qwerty version of the Advantage II keyboard becomes *7*, and so forth.

I use (or abuse) the keypad layer to bind programmed macros to keys, or to key combinations. This means, that when I am in the keypad layer, pressing specific keys will run specific macros. I avoid reprogramming the right-side keys (in-case I ever want to 10-key). This means the custom keybindings don't interfere with other normal uses of the keyboard, or with 10-key mode.

The default macros I have stored and bound to the keypad layer run complex chorded *emacs* commands that I don't like remembering or typing over-and-over. A list of these macros and their new keypad layer bindings follows in the next section.

The *kp* prefix that I use below indicates that we must be in the keypad layer and then press the key combination. *kp-a* means pressing the *a* key when in keypad mode.  You can do this by pressing *keypd* to lock the keypad layer, pressing the *a* key-- and then pressing the *keypd* key again to exit the keypad layer.

So far, that is not much of an improvement over using the chorded *emacs* keybindings and commands. So why bother?

Well, I use a Kensis foot pedal to toggle turning the keypad layer on and off (like the shift key does for the shift layer).

So when I press and hold the footpedal and hit the c key (*kp-c*), the keyboard runs an internal macro that I have programmed. This causes it to "type": *Cntl-c p c*. This is the command used in *emacs* projectile mode to compile a project.

Of course, this won't work if you don't first program the macros into your keyboard. Here are the macros I have programmed into mine and what they do:

## Keypad layer to emacs command mapping
| Keypad Command | command | emacs keybinding (if bound) |
| -------------  |-------------| -----|
| **Cursor movement keys** |   |  |
| *kp-a* | beginning-of-defun      | C-M-a |
| *kp-e* | end-of-defun            | C-M-e |
| *kp-LAlt-Space*  |  mark-defun  | C-M-h |
| *kp-f*  | forward-sexp     | C-M-f |
| *kp-b*  | backward-sexp    | C-M-b |
| *kp-LCtrl-Space* | mark-sexp     | C-M-<SPC> |
| **Spell Checking** | | |
| *kp-s* |  ispell-word | (Meta-$) |
| *kp-NumRow4* | flyspell-mode | M-x flyspell-mode |
| *kp-LShift-NumRow4* | flyspell-prog-mode | M-x flyspell-prog-mode |
| **Projectile commands** | | |
| *kp-c* | projectile-compile-project |  C-c p c |
| *kp-t* | projectile-compile-test      |  C-c p P |
| *kp-g* | grep in projectile project   | C-c p g s |
| *kp-r* | Simple refactoring with text replace in current project | C-c p r |
| *kp-LShift-f* | Jump to any file in the project | C-c p f |
| *kp-LShift-d* | Jump to any directory in the project | C-c p d |
| *kp-LShift-b* | List buffers local to current project | C-c p b |
| *kp-LShift-e* | Jump to recently visited files in project | C-c p e |
| *kp-LShift-o* | Multi-occur in project buffers | C-c p o |
| *kp-LShift-p* | Switch visited projects (visited once and Projectile remembers) | C-c p p |
| *kp-LShift-a* | Switch between header and detail files .h and .c or .cpp | C-c p a |
| **helm commands** |   |  |
*kp-z* | moo-jump-local |  C-M-k |
| *kp-LCtrl-r* | helm-gtags-find-rtags  | C-c g r |
| *kp-LCtrl-s* | helm-gtags-find-symbol | C-c g s. |
| *kp-LCtrl-a* | helm-gtags-tags-in-this-function | C-c g a |
| *kp-right arrow* | helm-gtags-dwim  | M-. |
| *kp-left arrow* | tags-loop-continue |  M-, |
| *kp-LCtrl-f* | helm-gtags-find-files | |
| *kp-LCtrl-d* | helm-gtags-show-stack | |
| *kp-w* |  helm-man-woman, view man pages | C-c h m |
| **sr-speedbar** |    |    |
| *kp-q* | sr-speedbar-toggle |  |

## Raw keybindings

Below are the raw commands that are saved to a text file on a usb drive and then loaded into the keyboard to program the above macros (read owner's manual to see how to do this).

```
[rwin]>[ralt]
[kp-rwin]>[kp-ralt]
{kp-a}>{-lctrl}{-lalt}{a}{+lalt}{+lctrl}
{kp-e}>{-lctrl}{-lalt}{e}{+lctrl}{+lalt}
{kp-lalt}{kp0}>{-lctrl}{-lalt}{h}{+lalt}{+lctrl}
{kp-b}>{-kp-lctrl}{-kp-lalt}{kp-b}{+kp-lalt}{+kp-lctrl}
{kp-lctrl}{kp0}>{-lctrl}{-lalt}{space}{+lalt}{+lctrl}
{kp-s}>{-lalt}{-lshift}{4}{+lshift}{+lalt}
{kp-4}>{-lalt}{x}{+lalt}{d125}{f}{l}{y}{s}{p}{e}{l}{l}{hyphen}{m}{o}{d}{e}{d125}{enter}
{kp-lshift}{kp-4}>{-lalt}{x}{+lalt}{d125}{f}{l}{y}{s}{p}{e}{l}{l}{hyphen}{p}{r}{o}{g}{hyphen}{m}{o}{d}{e}{d125}{enter}
{kp-c}>{-lctrl}{c}{+lctrl}{p}{c}
{kp-t}>{-lctrl}{c}{+lctrl}{p}{-lshift}{p}{+lshift}{enter}
{kp-g}>{-lctrl}{c}{+lctrl}{p}{g}{s}
{kp-r}>{-lctrl}{c}{+lctrl}{p}{r}
{kp-lshift}{kp-f}>{-lctrl}{c}{+lctrl}{p}{f}
{kp-lshift}{kp-d}>{-lctrl}{c}{+lctrl}{p}{d}
{kp-lshift}{kp-b}>{-lctrl}{c}{+lctrl}{p}{b}
{kp-lshift}{kp-e}>{-lctrl}{c}{+lctrl}{p}{e}
{kp-lshift}{kp9}>{-lctrl}{c}{+lctrl}{p}{o}
{kp-lshift}{kpmin}>{-lctrl}{c}{+lctrl}{p}{p}
{kp-lshift}{kp-a}>{-lctrl}{c}{+lctrl}{p}{a}
{kp-z}>{-lctrl}{-lalt}{k}{+lalt}{+lctrl}
{kp-lctrl}{kp-r}>{-lctrl}{c}{+lctrl}{g}{r}
{kp-lctrl}{kp-s}>{-lctrl}{c}{+lctrl}{g}{s}
{kp-lctrl}{kp-a}>{-lctrl}{c}{+lctrl}{g}{a}
{kp-right}>{-lalt}{.}{+lalt}
{kp-left}>{-lalt}{,}{+lalt}
{kp-lctrl}{kp-f}>{-lalt}{x}{+lalt}{d125}{h}{e}{l}{m}{hyphen}{g}{t}{a}{g}{s}{hyphen}{f}{i}{n}{d}{hyphen}{f}{i}{l}{e}{s}{d125}{enter}
{kp-lctrl}{kp-d}>{-lalt}{x}{+lalt}{d125}{h}{e}{l}{m}{hyphen}{g}{t}{a}{g}{s}{hyphen}{s}{h}{o}{w}{hyphen}{s}{t}{a}{c}{k}{d125}{enter}
{kp-w}>{-lctrl}{c}{+lctrl}{h}{m}
{kp-q}>{-lalt}{x}{+lalt}{d125}{s}{r}{hyphen}{s}{p}{e}{e}{d}{b}{a}{r}{hyphen}{t}{o}{g}{g}{l}{e}{d125}{enter}
```
