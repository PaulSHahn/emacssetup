# emacssetup

Emacs setup files for Python and Javascript development. The current master branch is for an *emacs* 26 setup.  Emacs 27 is on its way and will simplify
Javascript setup and provide native support for typescript.

# Using this repository

*So what do you do with this repo?*

Well, you clone it into your *emacs* settings directory, at: *~/.emacs.d*:

```bash
cd ~/
mv ~/.emacs.d ./.emacs.d.old
git clone git@github.com:PaulSHahn2/emacssetup.git .emacs.d/
```

# Build your own emacs or use what the OS distribution provided?

If your OS doesn't have at least version 26 of *emacs* installed, you will want to build your own.

You may want to build your own once you have an extensive setup. Modern versions of *emacs* use packages, so the default version provided by your
distribution is not as likely to be as broken as they used to be.

# Building

## Building On Ubuntu LTS (pxmicroservdev & pxmicroserv):

```bash
# add sources repos in /etc/apt/sources.list by uncommenting srcs repositories matching the binary equivalents.
sudo apt-get update
sudo apt-get build-dep emacs25 # or most recent version available.
sudo apt-get install libgtk-3-dev libwebkit2gtk-4.0-dev
# change the prefix to be whereever you wish. Your local home directory if you want.
./configure --with-modules --with-cairo --with-xwidgets --with-x-toolkit=gtk3 --prefix=/opt/npc --exec-prefix=/opt/npc
make -j
sudo mkdir /opt/npc
sudo chmod 755 /opt/npc
sudo make install prefix=/opt/npc exec-prefix=/opt/npc
```

# Setup your emacs after cloning
1. On your first startup, you will likely get errors that show in the terminal
   window. This is because needed packages will not be installed. Let's install them:

2. Inside *emacs*, list your packages:
    * **M-x list-packages:** shows the packages. Press 'r' to reload available packages.
    * **M-x package-install-selected-packages:** installs all packages listed in *.emacs.d/init.el* file in section package-selected-packages.  Note that it may
    appear that emacs has hung when you run this. You may see a message in the mini-buffer that states: "Contacting Melpa...".  You are especially likely to see
    this if you have a slow or flaky connection. If you look in .emacs.d/elpha/ you will likely see that packages are appearing as they are downloaded. If you
    restart emacs before it finishes, thinking it has hung-- then it will loose track of the current package and you will just end up starting all over.

3. Restart emacs entirely. If you are running emacs in *daemon mode*, kill the dameon: `killall emacs` You can also optionally tell emacs to re-read its config
    files:
   * **M-x load-file** *~/.emacs.d/emacs.init*

    It is safer to just restart the editor.

# Using setup across multiple machines.

Since this is a git repository, it is easy to use across multiple machines, you just clone it to every machine where you use emacs. Occasionally, you may have
issues with one machines version of emacs.  If you cannot modify your setup such that it works everywhere, then create a branch for each setup you need.

A good example of this would be creating a branch for each major version of emacs: an emacs 26 version branch, and an emacs 25, and a 27 branch. Then you just
clone the repo and use the branch you need.

# Committing Changes

*Don't forget to commit and push your changes back to your forked repository.*

You may want to exit *emacs* completely before you save your work. Emacs can interactively change the contents of your *~/emacs.d/init.el* file as it saves
settings. You want to just go to the command line and use git to save and push your work.

# Emacs setup notes

**Note:** You should read the GNU info manual on *emacs* or you won't get anything out of what follows...

## Projectile

Automatically manage and refactor code in projects.

<https://docs.projectile.mx/en/latest/>

## Helm

Advanced Completion engine.

<https://emacs-helm.github.io/helm/>

## elpy

Python IDE

<https://elpy.readthedocs.io/en/latest/introduction.html>

## maggit

Git layer.

<https://magit.vc/manual/magit/Getting-Started.html#Getting-Started>

## tide & javascript

fixme, add links and stuff.

## Kenesis Keyboard emacs setup

What follows is specific to the keyboard I use and is of no use to anyone without it.

Keyboard manual is here:

<https://kinesis-ergo.com/wp-content/uploads/Adv2-Users-Manual-fw1.0.517-4-24-20.pdf>

### Keypad layer

The *kp* prefix used below indicates that we are referring to the keypad layer of the Advantage keyboard. The shift key is also a layer, it makes the keys print
capitals instead of lower case, and the number lock key locks the 10 key to numbers. In this case of the keypad layer, the keypad button triggers this separate
mode. The keypad layer is used to run macros bound to keys (it is a programmable keyboard).  The default macros stored are for *emacs* commands.

The *kp* prefix is the default action of my foot pedal that I use with the keyboard, the pedal just presses keypad (like you would press the shift key) and that
puts the keyboard in the alternate entry mode.

So when we press and hold the footpedal and hit the c key (*kp-c*) the keyboard runs an internal macro that we have programmed. It then "types": *Cntl-c p
c*. This is the command to compile a project.


### Keypad layer to emacs command mapping
| Keypad Command | command | emacs keybinding (if bound) |
| -------------  |-------------| -----|
| **Cursor movement keys** |   |  |
| *kp-a* | beginning-of-defun      | C-M-a |
| *kp-e* | end-of-defun            | C-M-e |
| *kp-LAltf-Space*  |  mark-defun  | C-M-h |
| *kp-f*  | forward-sexp     | C-M-f |
| *kp-b*  | backward-sexp    | C-M-b |
| *kp-LCtrl-Space* | mark-sexp     | C-M-<SPC> |
| **Spell Checking** | | |
| *kp-s* |  ispell-word | (Meta-$) |
| *kp-NumRow4* | flyspell-mode | M-x flyspell-mode |
| *kp-LShift-NumRow4* | Flyspell-prog-mode | M-x flyspell-prog-mode |
| **Projectile commands** | | |
| *kp-c* | projectile-compile-project |  C-c p c |
| *kp-t* | projectile-compile-test      |  C-c p P |
| *kp-g* | Grep in projectile           | C-c p g s |
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

## Actual commands to store keybindings to keyboard in programming mode

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
