# emacssetup

Emacs setup tailored for the Python and Javascript development we will be doing at *NPC*. Currently, the master branch contains settings intended for *emacs*
major version 26.

# Emacs setup notes

**Note:** If you are new to *emacs* you may want to read some tutorials at this point. I would read the GNU info manual for *emacs*. You can do this on your
local machine using the *info* command, or online: <https://www.gnu.org/software/emacs/manual/>.

Many other resources are available as well. Some quality ones:

* <https://www.emacswiki.org/>
* <http://ergoemacs.org/>

Again, if you don't know *emacs*, please read the GNU manual and go through the basic exercises attempting to use this setup.

# Using this repository

*So what do you do with this repo?*

Well, I clone it to my *emacs* settings directory at: *~/.emacs.d*. I do this on all the machines that I use:

```bash
# goto home directory
cd ~/
# move your old emacs settings, if any-- out of the way
mv ~/.emacs.d ~/.emacs.d.old
# clone your new settings directory
git clone git@github.com:PaulSHahn2/emacssetup.git ~/.emacs.d/
```

This allows me to have one setup for all instances of *emacs* and to keep that setup synchronized.

If you wish to reuse this, you should probably either *fork* this repository to your github home, or use the github template feature to create a new repository
containing this ones' latest and greatest contents.

When you are done with that, then you can clone and modify your new repository to meet your needs.

# Building

Below are some quick instructions on building your own *emacs*, in case you need or want to.

## Building emacs 26 On Ubuntu LTS:

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

**FIXME:** add SuSE and RHEL/CentOS build instructions

# Finish setup of your emacs after cloning

1. On your first startup after cloning, you will get errors that show in the terminal window. This is because the settings you have cloned from *git* reference
   packages that have not yet been installed. Let's install them locally to your home *.emacs.d* directory:

2. Start *emacs*, then list your installed packages:
    * **M-x list-packages:** This shows the packages. Press 'r' to reload available packages from the configured repositories (melpa).
    * **M-x package-install-selected-packages:** installs all packages listed in *.emacs.d/init.el* file (listed in section package-selected-packages). Note
    that it may appear that *emacs* has hung when you run this. You may see a message in the mini-buffer that states: "Contacting Melpa...".  You are especially
    likely to see this if you have a slow or flaky connection. If you look in directory *~/.emacs.d/elpha/* you will likely see that packages are appearing as
    they are downloaded. If you restart *emacs* before it finishes, thinking it has hung-- then it will loose track of the current package. You will just end up
    having to restart the download for that package again.

3. Exit and restart *emacs*. If you are running *emacs* in *daemon mode*, kill the dameon: `killall emacs`.

# Using your settings across multiple machines

Since this is a *git* repository, it is easy to use across multiple machines, you just clone it to every machine where you use *emacs*. Occasionally, you may have
issues with one machines version of *emacs*.  If you cannot modify your setup such that it works everywhere, then create a branch for each setup you need.

A good example of this would be creating a branch for each major version of *emacs*: an emacs 26 branch, a 25 branch, etc. Then you just
clone the repo and checkout the branch matching your version.

# Committing Changes

*Don't forget to commit and push your changes back to your forked repository.*

Note that *emacs* can interactively change the contents of your *~/emacs.d/init.el* file as it saves updates you have requested. Use *git* on the command line, or
use *maggit* inside *emacs* to commit and push your changes back to your repository.

# Environment Setup

I set up *emacs* to be the default editor in my bash environment. I do this by adding the following to file *~/.bashrc*:

```bash
export VISUAL='emacsclient -c --alternate-editor='
export EDITOR='emacsclient -t --alternate-editor='
alias e="${VISUAL}"
```

I like to run *emacs* in daemon mode (as a server). This is a better way to run *emacs* on modern systems, since it shares resources with other windowed
instances of *emacs* and they are aware of what each other is doing.

By default, *emacsclient* starts a new client that connects to the existing emacs daemon running in the background. The "--alternate-editor=" syntax is awkward,
 but it essentially means start up a new *emacs* daemon if the client could not connect to an existing one. If you put an argument after the *=*, it would
 instead startup some other editor that you specified as a backup option.

Remember that the *VISUAL* variable is reserved for editors running in *X* or *wayland* and *EDITOR* is reserved for editors running inside a terminal. We pass
*-t* to run a terminal version when EDITOR is called by the OS or some other running program. This starts a new *emacs* client inside the terminal.

When we are running in a visual environment, we create a new window (*frame* in emacs-speak) via *-c*. Without this, *emacs* would try and find an existing
window and change the contents of that window. I prefer to have a new window (er... frame) for everything I explicitly open.

Note that these commands and options are specific to recent versions of *emacs*. Older versions of *emacs* and *emacsclient* take different options and
*emacsclient* has a different name or doesn't exist at all on really old versions of *emacs*.

# Packages installed with this setup

Some of the packages included in this setup:

## projectile

Projectile is an *emacs* package that adds support and awareness for management of development projects. This is similar to how monolithic IDE's provide their
own (often IDE specific) project file format (or something like *Maven*).  Projectile includes support for automatic refactoring of code and movement between
files within projects.  It is programming language and tool agnostic and attempts to recognize projects of many different types and tools. Frequently support is
added via the use of other pluggable support packages.

<https://docs.projectile.mx/en/latest/>

## helm

Advanced Completion engine. This extends and replaces the default tab completion that comes out of the box with *emacs*.

<https://emacs-helm.github.io/helm/>

## elpy

This package provides advanced Python specific IDE abilities and greatly enhances the Python programming experience inside *emacs*.

<https://elpy.readthedocs.io/en/latest/introduction.html>

## maggit

A full *git* layer. This is very handy and very well done.

<https://magit.vc/manual/magit/Getting-Started.html#Getting-Started>

## markdown mode

Provides the ability to edit markdown files and see the output of files edited.

<https://www.emacswiki.org/emacs/MarkdownMode>

## whitespace ws-butler or whitespace-cleanup-mode

I have two different ways to get rid of whitespace.

1. **ws-bulter:** The default. This is a gentler program that only cleans up whitespace in the area you have modified. Everyone else's strange whitespacing is
   left alone. This is the default enabled in most editing and programming modes.

2. **whitespace-cleanup-mode:** This nukes all erroneous whitespace in the file everytime you save to disk. It is not on by default, but just installed.

Which one to use?

If you are working on legacy code with others, you may want to use *ws-butler*. Otherwise, if you use whitespace-cleanup-mode you will have huge commit sizes
that have nothing to do with your change, since you will have reformatted the entire file every-time you save. If you are on greenfield development it should not
matter-- ws-bulter will keep you safe to begin with. If you are refactoring or cleaning up code, then whitespace-cleanup-mode may be a better choice.

You can manually start whitespace-cleanup-mode on any buffer via *M-x whitespace-cleanup-mode*. You can set it up to be always on instead of ws-bulter by
editing *~/emacs.d/custom/setup-editing.el* and removing the lines commenting out global-whitespace-cleanup-mode. You should also comment out ws-butler at the
same time (since you really only need one running at a time).


## tide & javascript

**fixme** Add links and stuff when the Javascript setup for this is finalized (probably not until emacs 27).

# Kenesis Advantage II emacs setup

What follows is specific to the keyboard I use. It is of no use to anyone who doesn't also use the Advantage II keyboard.

Note that the Keyboard manual is here:

<https://kinesis-ergo.com/wp-content/uploads/Adv2-Users-Manual-fw1.0.517-4-24-20.pdf>

## Keypad layer

The *kp* prefix used below indicates that we are referring to the keypad layer of the Advantage II keyboard.

What does *keypad layer* jargon mean?

Well, another layer you have used on any keyboard is the shift layer. The shift key temporarily enters this layer while held down. The capslock toggles turning
it off and on. Obviously, the shift layer makes the keys print capitals instead of lower case. Similarly, the number lock key locks the 10 key to emit numbers.

In this case of the keypad layer, the *keypd* button at the top right triggers this separate mode. It is used out of the box to let you ten key. Like most
laptop keyboards, the keyboard doesn't have a physically separate keypad for 10 key.  Pressing this, turns the keys on the rightmost side of the keyboard into a
10 key. So key *u* on a qwerty version of the Advantage II keyboard becomes *7*, and so forth.

I use the keypad layer to store programmable macros to keys and key combinations inside the keyboard map. I just avoid overlaying the right-side keys (in-case I
ever want to 10-key). This means the keybindings don't interfere with other normal uses of the keyboard.

The default macros I have stored and bound to the keypad layer run complex chorded *emacs* commands that I don't like remembering or typing
over-and-over. A list of these macros and their new keypad layer bindings follows in the next section.

The *kp* prefix that I use below indicates that we must be in the keypad layer and then press the key combination. *kp-a* means pressing the *a* key when in
keypad mode.  You can do this by pressing *keypd* to lock the keypad layer, pressing the *a* key-- and then pressing the *keypd* key again to exit the keypad
layer.

So far, that is not much more efficient than just using the complex long chorded *emacs* command. So why bother?

Well, I use a foot pedal to toggle turning the keypad layer on and off (like the shift key does for the shift layer).

So when I press and hold the footpedal and hit the c key (*kp-c*) the keyboard runs an internal macro that I have programmed. This causes it to "type": *Cntl-c p
c*. This is the command used in *emacs* projectile mode to compile a project.

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
| *kp-LShift-NumRow4* | Flyspell-prog-mode | M-x flyspell-prog-mode |
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

Below are the raw commands that are saved to a text file on a usb drive and then loaded into the keyboard to program the above macros (read owner's manual to
see how to do this).

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
