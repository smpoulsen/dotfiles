;; -*- mode: emacs-lisp; lexical-binding: t -*-
;; This file is loaded by Spacemacs at startup.
;; It must be stored in your home directory.

(defun dotspacemacs/layers ()
  "Layer configuration:
This function should only modify configuration layer settings."
  (setq-default
   ;; Base distribution to use. This is a layer contained in the directory
   ;; `+distribution'. For now available distributions are `spacemacs-base'
   ;; or `spacemacs'. (default 'spacemacs)
   dotspacemacs-distribution 'spacemacs ;;-base
   ;; Lazy installation of layers (i.e. layers are installed only when a file
   ;; with a supported type is opened). Possible values are `all', `unused'
   ;; and `nil'. `unused' will lazy install only unused layers (i.e. layers
   ;; not listed in variable `dotspacemacs-configuration-layers'), `all' will
   ;; lazy install any layer that support lazy installation even the layers
   ;; listed in `dotspacemacs-configuration-layers'. `nil' disable the lazy
   ;; installation feature and you have to explicitly list a layer in the
   ;; variable `dotspacemacs-configuration-layers' to install it.
   ;; (default 'unused)
   dotspacemacs-enable-lazy-installation 'unused
   ;; If non-nil then Spacemacs will ask for confirmation before installing
   ;; a layer lazily. (default t)
   dotspacemacs-ask-for-lazy-installation t
   ;; If non-nil layers with lazy install support are lazy installed.
   ;; List of additional paths where to look for configuration layers.
   ;; Paths must have a trailing slash (i.e. `~/.mycontribs/')
   dotspacemacs-configuration-layer-path '()
   ;; List of configuration layers to load.
   dotspacemacs-configuration-layers
   '(
     shell-scripts
     clojure
     ;; ----------------------------------------------------------------
     ;; Example of useful layers you may want to use right away.
     ;; Uncomment some layer names and press `SPC f e R' (Vim style) or
     ;; `M-m f e R' (Emacs style) to install them.
     ;; ----------------------------------------------------------------
     ;; agda
     (auto-completion :variables
                      auto-completion-tab-key-behavior 'complete
                      auto-completion-return-key-behavior 'complete
                      auto-completion-enable-sort-by-usage t)
     ;; eyebrowse
     ;; htmlize
     better-defaults
     colors
     csv
     dash
     elixir
     ;;elm
     emacs-lisp
     erlang
     ess
     ;;fish
     ;;flow-type
     git
     gtags
     (haskell :variables haskell-completion-backend 'intero)
     html
     idris
     ivy
     javascript
     markdown
     ;;ocaml
     (org :variables)
          ;;org-enable-reveal-js-support t)
     purescript
     python
     racket
     react
     ;;reason
     restclient
     ruby
     ruby-on-rails
     rust
     shell
     shell-scripts
     spacemacs-editing
     spacemacs-editing-visual
     spacemacs-layouts
     spacemacs-org
     spacemacs-visual
     spell-checking
     sql
     syntax-checking
     terraform
     themes-megapack
     yaml
     treemacs
     )
   ;; List of additional packages that will be installed without being
   ;; wrapped in a layer. If you need some configuration for these
   ;; packages, then consider creating a layer. You can also put the
   ;; configuration in `dotspacemacs/user-config'.
   dotspacemacs-additional-packages '(ag
                                      evil-surround
                                      wgrep-ag
                                      pinentry
                                      )
   ;; A list of packages that cannot be updated.
   dotspacemacs-frozen-packages '()
   ;; A list of packages that will not be installed and loaded.
   dotspacemacs-excluded-packages '()
   ;; Defines the behaviour of Spacemacs when installing packages.
   ;; Possible values are `used-only', `used-but-keep-unused' and `all'.
   ;; `used-only' installs only explicitly used packages and uninstall any
   ;; unused packages as well as their unused dependencies.
   ;; `used-but-keep-unused' installs only the used packages but won't uninstall
   ;; them if they become unused. `all' installs *all* packages supported by
   ;; Spacemacs and never uninstall them. (default is `used-only')
   dotspacemacs-install-packages 'used-only))

(defun dotspacemacs/init ()
  "Initialization function.
This function is called at the very startup of Spacemacs initialization
before layers configuration.
You should not put any user code in there besides modifying the variable
values."
  (setq configuration-layer--elpa-archives
        '(("melpa" . "http://melpa.org/packages/")
          ;;("org"   . "https://raw.githubusercontent.com/d12frosted/elpa-mirror/master/org/")
          ("gnu"   . "http://elpa.gnu.org/packages/")))

  ;; This setq-default sexp is an exhaustive list of all the supported
  ;; spacemacs settings.
  (setq-default
   ;; If non-nil then enable support for the portable dumper. You'll need
   ;; to compile Emacs 27 from source following the instructions in file
   ;; EXPERIMENTAL.org at to root of the git repository.
   ;; (default nil)
   dotspacemacs-enable-emacs-pdumper nil

   ;; Name of executable file pointing to emacs 27+. This executable must be
   ;; in your PATH.
   ;; (default "emacs")
   dotspacemacs-emacs-pdumper-executable-file "emacs"

   ;; Name of the Spacemacs dump file. This is the file will be created by the
   ;; portable dumper in the cache directory under dumps sub-directory.
   ;; To load it when starting Emacs add the parameter `--dump-file'
   ;; when invoking Emacs 27.1 executable on the command line, for instance:
   ;;   ./emacs --dump-file=$HOME/.emacs.d/.cache/dumps/spacemacs-27.1.pdmp
   ;; (default (format "spacemacs-%s.pdmp" emacs-version))
   dotspacemacs-emacs-dumper-dump-file (format "spacemacs-%s.pdmp" emacs-version)

   ;; If non-nil ELPA repositories are contacted via HTTPS whenever it's
   ;; possible. Set it to nil if you have no way to use HTTPS in your
   ;; environment, otherwise it is strongly recommended to let it set to t.
   ;; This variable has no effect if Emacs is launched with the parameter
   ;; `--insecure' which forces the value of this variable to nil.
   ;; (default t)
   dotspacemacs-elpa-https t
   ;; Maximum allowed time in seconds to contact an ELPA repository.
   dotspacemacs-elpa-timeout 5

   ;; Set `gc-cons-threshold' and `gc-cons-percentage' when startup finishes.
   ;; This is an advanced option and should not be changed unless you suspect
   ;; performance issues due to garbage collection operations.
   ;; (default '(100000000 0.1))
   dotspacemacs-gc-cons '(100000000 0.1)

   ;; Set `read-process-output-max' when startup finishes.
   ;; This defines how much data is read from a foreign process.
   ;; Setting this >= 1 MB should increase performance for lsp servers
   ;; in emacs 27.
   ;; (default (* 1024 1024))
   dotspacemacs-read-process-output-max (* 1024 1024)

   ;; If non-nil then Spacelpa repository is the primary source to install
   ;; a locked version of packages. If nil then Spacemacs will install the
   ;; latest version of packages from MELPA. Spacelpa is currently in
   ;; experimental state please use only for testing purposes.
   ;; (default nil)
   dotspacemacs-use-spacelpa nil

   ;; If non-nil then verify the signature for downloaded Spacelpa archives.
   ;; (default t)
   dotspacemacs-verify-spacelpa-archives t

   ;; If non-nil then spacemacs will check for updates at startup
   ;; when the current branch is not `develop'. Note that checking for
   ;; new versions works via git commands, thus it calls GitHub services
   ;; whenever you start Emacs. (default nil)
   dotspacemacs-check-for-update nil
   ;; If non-nil, a form that evaluates to a package directory. For example, to
   ;; use different package directories for different Emacs versions, set this
   ;; to `emacs-version'.
   dotspacemacs-elpa-subdirectory nil
   ;; One of `vim', `emacs' or `hybrid'.
   ;; `hybrid' is like `vim' except that `insert state' is replaced by the
   ;; `hybrid state' with `emacs' key bindings. The value can also be a list
   ;; with `:variables' keyword (similar to layers). Check the editing styles
   ;; section of the documentation for details on available variables.
   ;; (default 'vim)
   dotspacemacs-editing-style 'vim
   ;; If non nil output loading progress in `*Messages*' buffer. (default nil)
   dotspacemacs-verbose-loading nil
   ;; Specify the startup banner. Default value is `official', it displays
   ;; the official spacemacs logo. An integer value is the index of text
   ;; banner, `random' chooses a random text banner in `core/banners'
   ;; directory. A string value must be a path to an image format supported
   ;; by your Emacs build.
   ;; If the value is nil then no banner is displayed. (default 'official)
   dotspacemacs-startup-banner 'official
   ;; List of items to show in startup buffer or an association list of
   ;; the form `(list-type . list-size)`. If nil then it is disabled.
   ;; Possible values for list-type are:
   ;; `recents' `recents-by-project' `bookmarks' `projects' `agenda' `todos'.
   ;; List sizes may be nil, in which case
   ;; `spacemacs-buffer-startup-lists-length' takes effect.
   ;; The exceptional case is `recents-by-project', where list-type must be a
   ;; pair of numbers, e.g. `(recents-by-project . (7 .  5))', where the first
   ;; number is the project limit and the second the limit on the recent files
   ;; within a project.
   dotspacemacs-startup-lists '((recents . 5)
                                (projects . 7))

   ;; True if the home buffer should respond to resize events. (default t)
   dotspacemacs-startup-buffer-responsive t

   ;; Show numbers before the startup list lines. (default t)
   dotspacemacs-show-startup-list-numbers t

   ;; The minimum delay in seconds between number key presses. (default 0.4)
   dotspacemacs-startup-buffer-multi-digit-delay 0.4

   ;; Default major mode for a new empty buffer. Possible values are mode
   ;; names such as `text-mode'; and `nil' to use Fundamental mode.
   ;; (default `text-mode')
   dotspacemacs-new-empty-buffer-major-mode nil

   ;; Default major mode of the scratch buffer (default `text-mode')
   dotspacemacs-scratch-mode 'text-mode

   ;; If non-nil, *scratch* buffer will be persistent. Things you write down in
   ;; *scratch* buffer will be saved and restored automatically.
   dotspacemacs-scratch-buffer-persistent t

   ;; If non-nil, `kill-buffer' on *scratch* buffer
   ;; will bury it instead of killing.
   dotspacemacs-scratch-buffer-unkillable nil

   ;; Initial message in the scratch buffer, such as "Welcome to Spacemacs!"
   ;; (default nil)
   dotspacemacs-initial-scratch-message nil

   ;; List of themes, the first of the list is loaded when spacemacs starts.
   ;; Press `SPC T n' to cycle to the next theme in the list (works great
   ;; with 2 themes variants, one dark and one light)
   dotspacemacs-themes '(nord
                         sunburn
                         apropospriate-dark
                         zenburn
                         monokai
                         solarized-dark
                         solarized-light
                         leuven
                         )
   ;; If non nil the cursor color matches the state color in GUI Emacs.
   dotspacemacs-colorize-cursor-according-to-state t

   ;; Default font or prioritized list of fonts. The `:size' can be specified as
   ;; a non-negative integer (pixel size), or a floating-point (point size).
   ;; Point size is recommended, because it's device independent. (default 10.0)
   dotspacemacs-default-font '("Fira Code"
                               :size 16.0
                               :weight normal
                               :width normal)

   ;; The leader key (default "SPC")
   dotspacemacs-leader-key "SPC"

   ;; The key used for Emacs commands `M-x' (after pressing on the leader key).
   ;; (default "SPC")
   dotspacemacs-emacs-command-key "SPC"
   ;; The key used for Vim Ex commands (default ":")
   dotspacemacs-ex-command-key ":"
   ;; The leader key accessible in `emacs state' and `insert state'
   ;; (default "M-m")
   dotspacemacs-emacs-leader-key "M-m"
   ;; Major mode leader key is a shortcut key which is the equivalent of
   ;; pressing `<leader> m`. Set it to `nil` to disable it. (default ",")
   dotspacemacs-major-mode-leader-key ","
   ;; Major mode leader key accessible in `emacs state' and `insert state'.
   ;; (default "C-M-m")
   dotspacemacs-major-mode-emacs-leader-key "C-M-m"
   ;; These variables control whether separate commands are bound in the GUI to
   ;; the key pairs `C-i', `TAB' and `C-m', `RET'.
   ;; Setting it to a non-nil value, allows for separate commands under `C-i'
   ;; and TAB or `C-m' and `RET'.
   ;; In the terminal, these pairs are generally indistinguishable, so this only
   ;; works in the GUI. (default nil)
   dotspacemacs-distinguish-gui-tab nil
   ;; If non nil `Y' is remapped to `y$' in Evil states. (default nil)
   dotspacemacs-remap-Y-to-y$ nil
   ;; If non-nil, the shift mappings `<' and `>' retain visual state if used
   ;; there. (default t)
   dotspacemacs-retain-visual-state-on-shift t
   ;; If non-nil, J and K move lines up and down when in visual mode.
   ;; (default nil)
   dotspacemacs-visual-line-move-text nil
   ;; If non nil, inverse the meaning of `g' in `:substitute' Evil ex-command.
   ;; (default nil)
   dotspacemacs-ex-substitute-global nil
   ;; Name of the default layout (default "Default")
   dotspacemacs-default-layout-name "Scratch"
   ;; If non nil the default layout name is displayed in the mode-line.
   ;; (default nil)
   dotspacemacs-display-default-layout nil

   ;; If non-nil then the last auto saved layouts are resumed automatically upon
   ;; start. (default nil)
   dotspacemacs-auto-resume-layouts nil

   ;; If non-nil, auto-generate layout name when creating new layouts. Only has
   ;; effect when using the "jump to layout by number" commands. (default nil)
   dotspacemacs-auto-generate-layout-names nil

   ;; Size (in MB) above which spacemacs will prompt to open the large file
   ;; literally to avoid performance issues. Opening a file literally means that
   ;; no major mode or minor modes are active. (default is 1)
   dotspacemacs-large-file-size 1
   ;; Location where to auto-save files. Possible values are `original' to
   ;; auto-save the file in-place, `cache' to auto-save the file to another
   ;; file stored in the cache directory and `nil' to disable auto-saving.
   ;; (default 'cache)
   dotspacemacs-auto-save-file-location 'cache
   ;; Maximum number of rollback slots to keep in the cache. (default 5)
   dotspacemacs-max-rollback-slots 5
   ;; If non nil, `helm' will try to minimize the space it uses. (default nil)
   dotspacemacs-helm-resize nil
   ;; if non nil, the helm header is hidden when there is only one source.
   ;; (default nil)
   dotspacemacs-helm-no-header nil
   ;; define the position to display `helm', options are `bottom', `top',
   ;; `left', or `right'. (default 'bottom)
   dotspacemacs-helm-position 'bottom
   ;; Controls fuzzy matching in helm. If set to `always', force fuzzy matching
   ;; in all non-asynchronous sources. If set to `source', preserve individual
   ;; source settings. Else, disable fuzzy matching in all sources.
   ;; (default 'always)
   dotspacemacs-helm-use-fuzzy 'always
   ;; If non nil the paste micro-state is enabled. When enabled pressing `p`
   ;; several times cycle between the kill ring content. (default nil)
   dotspacemacs-enable-paste-transient-state nil
   ;; Which-key delay in seconds. The which-key buffer is the popup listing
   ;; the commands bound to the current keystroke sequence. (default 0.4)
   dotspacemacs-which-key-delay 0.4
   ;; Which-key frame position. Possible values are `right', `bottom' and
   ;; `right-then-bottom'. right-then-bottom tries to display the frame to the
   ;; right; if there is insufficient space it displays it at the bottom.
   ;; (default 'bottom)
   dotspacemacs-which-key-position 'bottom

   ;; Control where `switch-to-buffer' displays the buffer. If nil,
   ;; `switch-to-buffer' displays the buffer in the current window even if
   ;; another same-purpose window is available. If non-nil, `switch-to-buffer'
   ;; displays the buffer in a same-purpose window even if the buffer can be
   ;; displayed in the current window. (default nil)
   dotspacemacs-switch-to-buffer-prefers-purpose nil

   ;; If non-nil a progress bar is displayed when spacemacs is loading. This
   ;; may increase the boot time on some systems and emacs builds, set it to
   ;; nil to boost the loading time. (default t)
   dotspacemacs-loading-progress-bar t

   ;; If non-nil the frame is fullscreen when Emacs starts up. (default nil)
   ;; (Emacs 24.4+ only)
   dotspacemacs-fullscreen-at-startup nil

   ;; If non-nil `spacemacs/toggle-fullscreen' will not use native fullscreen.
   ;; Use to disable fullscreen animations in OSX. (default nil)
   dotspacemacs-fullscreen-use-non-native nil

   ;; If non-nil the frame is maximized when Emacs starts up.
   ;; Takes effect only if `dotspacemacs-fullscreen-at-startup' is nil.
   ;; (default nil) (Emacs 24.4+ only)
   dotspacemacs-maximized-at-startup nil

   ;; If non-nil the frame is undecorated when Emacs starts up. Combine this
   ;; variable with `dotspacemacs-maximized-at-startup' in OSX to obtain
   ;; borderless fullscreen. (default nil)
   dotspacemacs-undecorated-at-startup nil

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's active or selected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-active-transparency 90

   ;; A value from the range (0..100), in increasing opacity, which describes
   ;; the transparency level of a frame when it's inactive or deselected.
   ;; Transparency can be toggled through `toggle-transparency'. (default 90)
   dotspacemacs-inactive-transparency 90

   ;; If non-nil show the titles of transient states. (default t)
   dotspacemacs-show-transient-state-title t

   ;; If non-nil show the color guide hint for transient state keys. (default t)
   dotspacemacs-show-transient-state-color-guide t

   ;; If non-nil unicode symbols are displayed in the mode line.
   ;; If you use Emacs as a daemon and wants unicode characters only in GUI set
   ;; the value to quoted `display-graphic-p'. (default t)
   dotspacemacs-mode-line-unicode-symbols t

   ;; If non-nil smooth scrolling (native-scrolling) is enabled. Smooth
   ;; scrolling overrides the default behavior of Emacs which recenters point
   ;; when it reaches the top or bottom of the screen. (default t)
   dotspacemacs-smooth-scrolling t

   ;; Show the scroll bar while scrolling. The auto hide time can be configured
   ;; by setting this variable to a number. (default t)
   dotspacemacs-scroll-bar-while-scrolling t

   ;; Control line numbers activation.
   ;; If set to `t', `relative' or `visual' then line numbers are enabled in all
   ;; `prog-mode' and `text-mode' derivatives. If set to `relative', line
   ;; numbers are relative. If set to `visual', line numbers are also relative,
   ;; but lines are only visual lines are counted. For example, folded lines
   ;; will not be counted and wrapped lines are counted as multiple lines.
   ;; This variable can also be set to a property list for finer control:
   ;; '(:relative nil
   ;;   :visual nil
   ;;   :disabled-for-modes dired-mode
   ;;                       doc-view-mode
   ;;                       markdown-mode
   ;;                       org-mode
   ;;                       pdf-view-mode
   ;;                       text-mode
   ;;   :size-limit-kb 1000)
   ;; When used in a plist, `visual' takes precedence over `relative'.
   ;; (default nil)
   dotspacemacs-line-numbers t

   ;; Code folding method. Possible values are `evil', `origami' and `vimish'.
   ;; (default 'evil)
   dotspacemacs-folding-method 'evil

   ;; If non-nil and `dotspacemacs-activate-smartparens-mode' is also non-nil,
   ;; `smartparens-strict-mode' will be enabled in programming modes.
   ;; (default nil)
   dotspacemacs-smartparens-strict-mode nil

   ;; If non-nil smartparens-mode will be enabled in programming modes.
   ;; (default t)
   dotspacemacs-activate-smartparens-mode t

   ;; If non-nil pressing the closing parenthesis `)' key in insert mode passes
   ;; over any automatically added closing parenthesis, bracket, quote, etc...
   ;; This can be temporary disabled by pressing `C-q' before `)'. (default nil)
   dotspacemacs-smart-closing-parenthesis nil

   ;; Select a scope to highlight delimiters. Possible values are `any',
   ;; `current', `all' or `nil'. Default is `all' (highlight any scope and
   ;; emphasis the current one). (default 'all)
   dotspacemacs-highlight-delimiters 'all

   ;; If non-nil, start an Emacs server if one is not already running.
   ;; (default nil)
   dotspacemacs-enable-server nil

   ;; Set the emacs server socket location.
   ;; If nil, uses whatever the Emacs default is, otherwise a directory path
   ;; like \"~/.emacs.d/server\". It has no effect if
   ;; `dotspacemacs-enable-server' is nil.
   ;; (default nil)
   dotspacemacs-server-socket-dir nil

   ;; If non-nil, advise quit functions to keep server open when quitting.
   ;; (default nil)
   dotspacemacs-persistent-server nil

   ;; List of search tool executable names. Spacemacs uses the first installed
   ;; tool of the list. Supported tools are `rg', `ag', `pt', `ack' and `grep'.
   ;; (default '("rg" "ag" "pt" "ack" "grep"))
   dotspacemacs-search-tools '("rg" "ag" "pt" "ack" "grep")

   ;; Format specification for setting the frame title.
   ;; %a - the `abbreviated-file-name', or `buffer-name'
   ;; %t - `projectile-project-name'
   ;; %I - `invocation-name'
   ;; %S - `system-name'
   ;; %U - contents of $USER
   ;; %b - buffer name
   ;; %f - visited file name
   ;; %F - frame name
   ;; %s - process status
   ;; %p - percent of buffer above top of window, or Top, Bot or All
   ;; %P - percent of buffer above bottom of window, perhaps plus Top, or Bot or All
   ;; %m - mode name
   ;; %n - Narrow if appropriate
   ;; %z - mnemonics of buffer, terminal, and keyboard coding systems
   ;; %Z - like %z, but including the end-of-line format
   ;; If nil then Spacemacs uses default `frame-title-format' to avoid
   ;; performance issues, instead of calculating the frame title by
   ;; `spacemacs/title-prepare' all the time.
   ;; (default "%I@%S")
   dotspacemacs-frame-title-format "%I@%S"

   ;; Format specification for setting the icon title format
   ;; (default nil - same as frame-title-format)
   dotspacemacs-icon-title-format nil

   ;; Show trailing whitespace (default t)
   dotspacemacs-show-trailing-whitespace t

   ;; Delete whitespace while saving buffer. Possible values are `all'
   ;; to aggressively delete empty line and long sequences of whitespace,
   ;; `trailing' to delete only the whitespace at end of lines, `changed' to
   ;; delete only whitespace for changed lines or `nil' to disable cleanup.
   ;; (default nil)
   dotspacemacs-whitespace-cleanup `trailing

   ;; If non nil activate `clean-aindent-mode' which tries to correct
   ;; virtual indentation of simple modes. This can interfer with mode specific
   ;; indent handling like has been reported for `go-mode'.
   ;; If it does deactivate it here.
   ;; (default t)
   dotspacemacs-use-clean-aindent-mode t

   ;; Accept SPC as y for prompts if non nil. (default nil)
   dotspacemacs-use-SPC-as-y nil

   ;; If non-nil shift your number row to match the entered keyboard layout
   ;; (only in insert state). Currently supported keyboard layouts are:
   ;; `qwerty-us', `qwertz-de' and `querty-ca-fr'.
   ;; New layouts can be added in `spacemacs-editing' layer.
   ;; (default nil)
   dotspacemacs-swap-number-row nil

   ;; Either nil or a number of seconds. If non-nil zone out after the specified
   ;; number of seconds. (default nil)
   dotspacemacs-zone-out-when-idle nil

   ;; Run `spacemacs/prettify-org-buffer' when
   ;; visiting README.org files of Spacemacs.
   ;; (default nil)
   dotspacemacs-pretty-docs nil

   ;; If nil the home buffer shows the full path of agenda items
   ;; and todos. If non nil only the file name is shown.
   dotspacemacs-home-shorten-agenda-source nil

   ;; If non-nil then byte-compile some of Spacemacs files.
   dotspacemacs-byte-compile nil))

(defun dotspacemacs/user-env ()
  "Environment variables setup.
This function defines the environment variables for your Emacs session. By
default it calls `spacemacs/load-spacemacs-env' which loads the environment
variables declared in `~/.spacemacs.env' or `~/.spacemacs.d/.spacemacs.env'.
See the header of this file for more information."
  (spacemacs/load-spacemacs-env))

(defun dotspacemacs/user-init ()
  "Initialization for user code:
This function is called immediately after `dotspacemacs/init', before layer
configuration.
It is mostly for variables that should be set before packages are loaded.
If you are unsure, try setting them in `dotspacemacs/user-config' first.")


(defun dotspacemacs/user-load ()
  "Library to load while dumping.
This function is called only while dumping Spacemacs configuration. You can
`require' or `load' the libraries of your choice that will be included in the
dump.")

  ;;(load-file "./.emacs.d/flycheck-flow.el")

(defun dotspacemacs/user-config ()
  "Configuration function for user code.
This function is called at the very end of Spacemacs initialization after
layers configuration.
This is the place where most of your configurations should be done. Unless it is
explicitly specified that a variable should be set before a package is loaded,
you should place your code here."
  (message "loading user config!!!")

  (global-company-mode)
  (global-display-line-numbers-mode) ;; native emacs line numbers
  (golden-ratio-mode)
  (indent-guide-global-mode)

  ;; Powerline separator
  (setq powerline-default-separator 'arrow)

  ;; If non nil then the last auto saved layouts are resume automatically upon
  ;; If non nil then the last auto saved layouts are resume automatically upon
  (setq org-src-fontify-natively t)

  ;; fuzzy search when finding file names
  (setq ivy-re-builders-alist
        '((read-file-name-internal . ivy--regex-fuzzy)
          (t . ivy--regex-plus)))

  ;; Set tramp shell to bash b/c zsh PS1 makes it hang.
  ;;(eval-after-load 'tramp '(setenv "SHELL" "/bin/bash"))
  (setenv "SSH_AUTH_SOCK"
          (concat "/Users/" (getenv "USER") "/.gnupg/S.gpg-agent.ssh"))


  ;; Add babel function executors
  (org-babel-do-load-languages
   'org-babel-load-languages
   '(
     ;;(sh . t)
     (emacs-lisp . t)
     ;;(elixir . t)
     (js . t)
     (haskell . t)
     (python . t)
     ;;(R . t)
     ;;(ruby . t)
     ;;(sqlite . t)
     ))
  ;; Load org markdown to allow exporting to markdown
  (eval-after-load "org"
    '(require 'ox-md nil t))

  ;; Use a visal indicator that text has wrapped in visual-line-mode
  (setq visual-line-fringe-indicators '(left-curly-arrow right-curly-arrow))

  ;; Make swiper use helm's default buffer
  (setq swiper-helm-default-display-buffer 'helm-default-display-buffer)

  ;; Bind swiper to Leader-. and use Leader . / to start swiper-helm
  (spacemacs/declare-prefix "." "swiper-prefix")

  ;; Manually call ag with 'SPC /' because default search is broken
  (evil-leader/set-key "/" 'counsel-ag)

  ;; set emacsclient path for magit w/ on osx
  (setq-default with-editor-emacsclient-executable
                ;;"/nix/store/6v2yp5416pla8anq0rq2aqkq90s5i4vg-emacs-25.1/bin/emacsclient")
                ;;"/Applications/Emacs.app/Contents/MacOS/bin/emacsclient")
                ;;"/Users/sylvie/.nix-profile/bin/emacsclient"
                "/Applications/Emacs.app/Contents/MacOS/bin-x86_64-10_11/emacsclient")

  ;; don't refresh buffer-menu
  (add-to-list 'global-auto-revert-ignore-modes 'Buffer-menu-mode)

  ;; Add nix, stack, and node modules bins to path.
  ;; Tern, aspell, etc live in these.
  ;;(exec-path-from-shell-initialize)
  (push (expand-file-name "~/node_modules/.bin") exec-path)
  (push (expand-file-name "~/.local/bin") exec-path)
  (push (expand-file-name "~/.asdf/shims/mix") exec-path)
  (push (expand-file-name "~/.asdf/shims/bundler") exec-path)
  (push (expand-file-name  "~/.cache/rebar3/bin/rebar3") exec-path)

  ;; Make alchemist use asdf elixir versions
  (setq alchemist-mix-command "~/.asdf/shims/mix")

  (config-web-layers)

  (fira-code-ligatures)

  ;;(reason-mode-config)

  ;; Highlight strings representing colors with their color
  (add-hook 'prog-mode-hook 'rainbow-mode)

  ;; Identify missing delimiters
  ;;(add-hook 'prog-mode-hook #'rainbow-delimiters-mode)
  ;;(set-face-attribute 'rainbow-delimiters-unmatched-face nil
                      ;;:foreground "red"
                      ;;:inherit 'error
                      ;;:box t)

  ;; Configure evil-surround keybindings
  (global-evil-surround-mode 1)
  (evil-define-key 'visual evil-surround-mode-map "S" 'evil-substitute)
  (evil-define-key 'visual evil-surround-mode-map "s" 'evil-surround-region)

  ;; Something in the mode line is causing ediff to freeze.
  ;; This turns it off before starting ediff and back on after closing.
  ;; Ref: https://github.com/syl20bnr/spacemacs/issues/4730
  (add-hook 'ediff-before-setup-hook 'spacemacs/toggle-mode-line-off)
  (add-hook 'ediff-quit-hook 'spacemacs/toggle-mode-line-on)

  ;; Sunburn theme
  (add-to-list 'custom-theme-load-path "~/dotfiles/emacs/.emacs.d/themes")

  ;; Fix goto definition
  ;; (https://github.com/syl20bnr/spacemacs/issues/9756)
  (setq spacemacs-default-jump-handlers
        (remove 'evil-goto-definition spacemacs-default-jump-handlers))
  (setq spacemacs-default-jump-handlers
        (push 'erlang-find-tag spacemacs-default-jump-handlers))

  ;; gpg-agent pinentry in magit
  (setq-default magit-process-password-prompt-regexps
                '("^\\(Enter \\)?[Pp]assphrase\\( for \\(RSA \\)?key '.*'\\)?: ?$"
                  ;; Match-group 99 is used to identify the "user@host" part.
                  "^\\(Enter \\)?[Pp]assword\\( for '\\(https?://\\)?\\(?99:.*\\)'\\)?: ?$"
                  ;; Pinentry Curses box in the terminal when used with GnuPG
                  "Please enter the passphrase for the ssh key"
                  "^.*'s password: ?$"
                  "^Yubikey for .*: ?$"
                  "^Enter PIN for .*: ?$"))
)

(defun config-web-layers ()
  ;; Set indentation levels; override js, css, web modes to 2.
  (eval-after-load 'js-mode
    (setq js-indent-level 2))
  (setq css-indent-offset 2)
  (setq js2-basic-offset 2)
  (setq js2-bounce-indent-p t)
  (setq web-mode-markup-indentation 2)
  (setq web-mode-markup-indent-offset 2)
  (setq web-mode-code-indent-offset 2)
  (setq web-mode-attr-indent-offset 2)
  (setq indent-tabs-mode nil)
  (setq scss-indent-level 2)
  (with-eval-after-load 'web-mode
    (add-to-list 'web-mode-indentation-params '("lineup-args" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-concat" . nil))
    (add-to-list 'web-mode-indentation-params '("lineup-calls" . nil))
    )
  (eval-after-load 'json-mode
    (setq js-indent-level 2))
  (eval-after-load 'react-mode
    (setq js-indent-level 2))

  ;; Default .js files to open in react-mode
  (add-to-list 'auto-mode-alist '("\\.js\\'" . js-mode))

  ;; Default terp files to racket mode
  (add-to-list 'auto-mode-alist '("\\.tp\\'" . racket-mode))
)

(defun fira-code-ligatures ()
  ;; Fira code ligature support
  (let ((alist '((33 . ".\\(?:\\(?:==\\|!!\\)\\|[!=]\\)")
                 (35 . ".\\(?:###\\|##\\|_(\\|[#(?[_{]\\)")
                 (36 . ".\\(?:>\\)")
                 (37 . ".\\(?:\\(?:%%\\)\\|%\\)")
                 (38 . ".\\(?:\\(?:&&\\)\\|&\\)")
                 (42 . ".\\(?:\\(?:\\*\\*/\\)\\|\\(?:\\*[*/]\\)\\|[*/>]\\)")
                 (43 . ".\\(?:\\(?:\\+\\+\\)\\|[+>]\\)")
                 (45 . ".\\(?:\\(?:-[>-]\\|<<\\|>>\\)\\|[<>}~-]\\)")
                 (46 . ".\\(?:\\(?:\\.[.<]\\)\\|[.=-]\\)")
                 (47 . ".\\(?:\\(?:\\*\\*\\|//\\|==\\)\\|[*/=>]\\)")
                 (48 . ".\\(?:x[a-zA-Z]\\)")
                 (58 . ".\\(?:::\\|[:=]\\)")
                 (59 . ".\\(?:;;\\|;\\)")
                 (60 . ".\\(?:\\(?:!--\\)\\|\\(?:~~\\|->\\|\\$>\\|\\*>\\|\\+>\\|--\\|<[<=-]\\|=[<=>]\\||>\\)\\|[*$+~/<=>|-]\\)")
                 (61 . ".\\(?:\\(?:/=\\|:=\\|<<\\|=[=>]\\|>>\\)\\|[<=>~]\\)")
                 (62 . ".\\(?:\\(?:=>\\|>[=>-]\\)\\|[=>-]\\)")
                 (63 . ".\\(?:\\(\\?\\?\\)\\|[:=?]\\)")
                 (91 . ".\\(?:]\\)")
                 (92 . ".\\(?:\\(?:\\\\\\\\\\)\\|\\\\\\)")
                 (94 . ".\\(?:=\\)")
                 (119 . ".\\(?:ww\\)")
                 (123 . ".\\(?:-\\)")
                 (124 . ".\\(?:\\(?:|[=|]\\)\\|[=>|]\\)")
                 (126 . ".\\(?:~>\\|~~\\|[>=@~-]\\)")
                 )
               ))
    (dolist (char-regexp alist)
      (set-char-table-range composition-function-table (car char-regexp)
                            `([,(cdr char-regexp) 0 font-shape-gstring]))))
)

;; (defun reason-mode-config ()
;;   ;;----------------------------------------------------------------------------
;;   ;; Reason setup
;;   ;;----------------------------------------------------------------------------

;;   (defun shell-cmd (cmd)
;;     "Returns the stdout output of a shell command or nil if the command returned
;;    an error"
;;     (car (ignore-errors (apply 'process-lines (split-string cmd)))))

;;   (let* ((refmt-bin (or (shell-cmd "refmt ----where")
;;                         (shell-cmd "which refmt")))
;;          (merlin-bin (or (shell-cmd "ocamlmerlin ----where")
;;                          (shell-cmd "which ocamlmerlin")))
;;          (merlin-base-dir (when merlin-bin
;;                             (replace-regexp-in-string "bin/ocamlmerlin$" "" merlin-bin))))
;;     ;; Add npm merlin.el to the emacs load path and tell emacs where to find ocamlmerlin
;;     (when merlin-bin
;;       (add-to-list 'load-path (concat merlin-base-dir "share/emacs/site-lisp/"))
;;       (setq merlin-command merlin-bin))

;;     (when refmt-bin
;;       (setq refmt-command refmt-bin)))

;;     (setq opam-load-path "/usr/local/bin/opam")

;;   (require 'reason-mode)
;;   (require 'merlin)
;;   (add-hook 'reason-mode-hook (lambda ()
;;                                 (add-hook 'before-save-hook 'refmt-before-save)
;;                                 (merlin-mode)))

;;   (setq merlin-ac-setup t)
;; )

;; Do not write anything past this comment. This is where Emacs will
;; auto-generate custom variable definitions.
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(alchemist-iex-program-name "/Users/sylvie/.asdf/shims/iex")
 '(alchemist-mix-command "/Users/sylvie/.asdf/shims/mix")
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(compilation-message-face 'default)
 '(css-indent-offset 2)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   '("f01897ba52462e54f30e25d0eff9b7a09a8706d49da039e56d4a706ea8d02447" "99e22ce2d57e73191fcbcbd41d4d700ea0fa108e8abd20ff17dfcde3737d2b20" "101e7627031da560189eb8c485c2201b3a8faab27411b0a8ccf7dabbd226e922" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "ac41c8878a28ca7dc82b0384793e6e850a7d865c52d27696e20ff677c992944e" default))
 '(evil-want-Y-yank-to-eol nil)
 '(exec-path
   '("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/bin" "/opt/X11/bin" "/Users/sylvie/.asdf/bin" "/Users/sylvie/.asdf/shims" "/Users/sylvie/.kiex/elixirs/elixir-1.4/bin" "/Users/sylvie/.kiex/elixirs/elixir-1.3.2/bin" "/Users/sylvie/.kiex/bin" "/Users/sylvie/Library/Haskell/bin" "/Users/sylvie/.cabal/bin" "/Users/sylvie/.nix-profile/bin" "/Users/sylvie/.local/bin" "/usr/local/MacGPG2/bin" "/Library/Developer" "/Users/sylvie/.yarn/dist/bin" "/Users/sylvie/node_modules/.bin" "/nix/store/sk4ifn4k98gaizr4ny5lhcy4msiyd5d3-emacs-25.1/libexec/emacs/25.1/x86_64-apple-darwin15.0.0"))
 '(fci-rule-color "#4A4159" t)
 '(flycheck-erlang-rebar3-executable "/Users/sylvie/.cache/rebar3/bin/rebar3")
 '(flycheck-javascript-flow-args '("--respect-pragma"))
 '(glasses-separator "")
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(hl-bg-colors
   '("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342"))
 '(hl-fg-colors
   '("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3"))
 '(js-indent-level 2)
 '(magit-diff-use-overlays nil)
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#a7a6d4" "#9796c4" "#b48ead"))
 '(ns-confirm-quit t)
 '(package-selected-packages
   '(ob-elixir transient dash-docs lv ggtags nord-theme insert-shebang fish-mode company-shell sesman parseedn parseclj a edit-indirect rjsx-mode clj-refactor edn clojure-snippets paredit peg cider-eval-sexp-fu cider spinner queue clojure-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode cython-mode company-anaconda anaconda-mode pythonic counsel-tramp rg white-sand-theme rebecca-theme org-mime exotica-theme ghub org-category-capture dockerfile-mode sql-indent sunburn-theme evil-surround unfill ob-restclient madhat2r-theme fuzzy flycheck-credo company-restclient know-your-http-well reason-mode utop tuareg caml ocp-indent merlin org-mind-map monokai-theme autothemer csv-mode wrap-region harvest rainbow-mode rainbow-identifiers color-identifiers-mode wgrep-ag 0blayout ox-reveal company-flow flycheck-flow ac-capf solarized-theme yaml-mode ws-butler volatile-highlights uuidgen smartparens rainbow-delimiters move-text lorem-ipsum link-hint indent-guide hungry-delete highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt expand-region eval-sexp-fu highlight column-enforce-mode clean-aindent-mode auto-highlight-symbol aggressive-indent adaptive-wrap toc-org org-plus-contrib org-bullets projectile-rails inflections feature-mode ag spaceline powerline popwin neotree hl-todo golden-ratio fill-column-indicator fancy-battery persp-mode eyebrowse mwim zonokai-theme zenburn-theme zen-and-art-theme xterm-color wolfram-mode web-mode web-beautify vagrant-tramp vagrant underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toml-mode thrift tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme stan-mode spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode scad-mode sass-mode reverse-theme restclient railscasts-theme racket-mode faceup racer qml-mode purple-haze-theme pug-mode psci purescript-mode psc-ide professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme orgit organic-green-theme org-projectile org-present org-pomodoro alert log4e gntp org-download omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-http org noctilux-theme niflheim-theme naquadah-theme mustang-theme multi-term monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme matlab-mode material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow lush-theme livid-mode skewer-mode simple-httpd light-soap-theme less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc jbeans-theme jazz-theme ir-black-theme intero inkpot-theme idris-mode prop-menu htmlize hlint-refactor hindent heroku-theme hemisu-theme hc-zenburn-theme haskell-snippets haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md gandalf-theme flyspell-correct-ivy flyspell-correct flycheck-rust seq flycheck-pos-tip pos-tip flycheck-mix flycheck-haskell flycheck-elm flycheck flatui-theme flatland-theme firebelly-theme farmhouse-theme evil-magit magit magit-popup git-commit with-editor ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode espresso-theme eshell-z eshell-prompt-extras esh-help erlang emmet-mode elm-mode dracula-theme django-theme dash-at-point darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme counsel-dash helm-dash company-web web-completion-data company-tern dash-functional tern company-statistics company-ghci company-ghc ghc haskell-mode company-cabal colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme cherry-blossom-theme cargo rust-mode busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet yasnippet auto-dictionary arduino-mode apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes alchemist company elixir-mode afternoon-theme ac-ispell auto-complete rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake f s minitest chruby bundler inf-ruby which-key wgrep use-package smex pcre2el macrostep ivy-hydra hydra help-fns+ helm-make helm helm-core popup flx exec-path-from-shell evil-visualstar evil-escape evil goto-chg undo-tree elisp-slime-nav diminish counsel-projectile projectile pkg-info epl counsel swiper ivy bind-map bind-key auto-compile packed dash async ace-window avy quelpa package-build spacemacs-theme))
 '(pdf-view-midnight-colors '("#dedded" . "#4A4159"))
 '(psc-ide-add-import-on-completion t t)
 '(psc-ide-rebuild-on-save nil t)
 '(racer-rust-src-path "/Users/sylvie/.rust/rust/src")
 '(safe-local-variable-values
   '((encoding . utf-8)
     (elixir-enable-compilation-checking . t)
     (elixir-enable-compilation-checking)))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(standard-indent 2)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(vc-annotate-background "#433844")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#a7a6d4")
     (280 . "#676694")
     (300 . "#777694")
     (320 . "#8786b4")
     (340 . "#9796c4")
     (360 . "#b48ead")))
 '(vc-annotate-very-old-color "#b48ead")
 '(web-mode-markup-indent-offset 2 t)
 '(weechat-color-list
   (unspecified "#272822" "#20240E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil :family "Fira Code" :foundry "nil" :slant normal :weight normal :height 160 :width normal)))))
(defun dotspacemacs/emacs-custom-settings ()
  "Emacs custom settings.
This is an auto-generated function, do not modify its content directly, use
Emacs customize menu instead.
This function is called at the very end of Spacemacs initialization."
(custom-set-variables
 ;; custom-set-variables was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(alchemist-iex-program-name "/Users/sylvie/.asdf/shims/iex")
 '(alchemist-mix-command "/Users/sylvie/.asdf/shims/mix" t)
 '(ansi-color-faces-vector
   [default default default italic underline success warning error])
 '(ansi-color-names-vector
   ["#E5E9F0" "#99324B" "#4F894C" "#9A7500" "#3B6EA8" "#97365B" "#398EAC" "#3B4252"])
 '(blink-cursor-mode nil)
 '(column-number-mode t)
 '(compilation-message-face 'default)
 '(css-indent-offset 2 t)
 '(cua-global-mark-cursor-color "#2aa198")
 '(cua-normal-cursor-color "#657b83")
 '(cua-overwrite-cursor-color "#b58900")
 '(cua-read-only-cursor-color "#859900")
 '(custom-safe-themes
   '("f01897ba52462e54f30e25d0eff9b7a09a8706d49da039e56d4a706ea8d02447" "99e22ce2d57e73191fcbcbd41d4d700ea0fa108e8abd20ff17dfcde3737d2b20" "101e7627031da560189eb8c485c2201b3a8faab27411b0a8ccf7dabbd226e922" "b34636117b62837b3c0c149260dfebe12c5dad3d1177a758bb41c4b15259ed7e" "b85fc9f122202c71b9884c5aff428eb81b99d25d619ee6fde7f3016e08515f07" "ac41c8878a28ca7dc82b0384793e6e850a7d865c52d27696e20ff677c992944e" default))
 '(evil-want-Y-yank-to-eol nil)
 '(exec-path
   '("/usr/bin" "/bin" "/usr/sbin" "/sbin" "/usr/local/bin" "/opt/X11/bin" "/Users/sylvie/.asdf/bin" "/Users/sylvie/.asdf/shims" "/Users/sylvie/.kiex/elixirs/elixir-1.4/bin" "/Users/sylvie/.kiex/elixirs/elixir-1.3.2/bin" "/Users/sylvie/.kiex/bin" "/Users/sylvie/Library/Haskell/bin" "/Users/sylvie/.cabal/bin" "/Users/sylvie/.nix-profile/bin" "/Users/sylvie/.local/bin" "/usr/local/MacGPG2/bin" "/Library/Developer" "/Users/sylvie/.yarn/dist/bin" "/Users/sylvie/node_modules/.bin" "/nix/store/sk4ifn4k98gaizr4ny5lhcy4msiyd5d3-emacs-25.1/libexec/emacs/25.1/x86_64-apple-darwin15.0.0"))
 '(exwm-floating-border-color "#c2c6cb")
 '(fci-rule-color "#4A4159" t)
 '(flycheck-erlang-rebar3-executable "/Users/sylvie/.cache/rebar3/bin/rebar3")
 '(flycheck-javascript-flow-args '("--respect-pragma"))
 '(glasses-separator "")
 '(global-display-line-numbers-mode t)
 '(highlight-changes-colors '("#FD5FF0" "#AE81FF"))
 '(highlight-tail-colors
   '(("#20240E" . 0)
     ("#679A01" . 20)
     ("#4BBEAE" . 30)
     ("#1DB4D0" . 50)
     ("#9A8F21" . 60)
     ("#A75B00" . 70)
     ("#F309DF" . 85)
     ("#20240E" . 100)))
 '(hl-bg-colors
   '("#DEB542" "#F2804F" "#FF6E64" "#F771AC" "#9EA0E5" "#69B7F0" "#69CABF" "#B4C342"))
 '(hl-fg-colors
   '("#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3" "#fdf6e3"))
 '(jdee-db-active-breakpoint-face-colors (cons "#F0F4FC" "#5d86b6"))
 '(jdee-db-requested-breakpoint-face-colors (cons "#F0F4FC" "#4F894C"))
 '(jdee-db-spec-breakpoint-face-colors (cons "#F0F4FC" "#B8C5DB"))
 '(js-indent-level 2)
 '(magit-diff-use-overlays nil)
 '(magit-git-executable "/usr/local/bin/git")
 '(nrepl-message-colors
   '("#CC9393" "#DFAF8F" "#F0DFAF" "#7F9F7F" "#BFEBBF" "#a7a6d4" "#9796c4" "#b48ead"))
 '(ns-confirm-quit t)
 '(objed-cursor-color "#99324B")
 '(package-selected-packages
   '(pinentry ob-elixir transient dash-docs lv ggtags nord-theme insert-shebang fish-mode company-shell sesman parseedn parseclj a edit-indirect rjsx-mode clj-refactor edn clojure-snippets paredit peg cider-eval-sexp-fu cider spinner queue clojure-mode yapfify pyvenv pytest pyenv-mode py-isort pip-requirements live-py-mode hy-mode cython-mode company-anaconda anaconda-mode pythonic counsel-tramp rg white-sand-theme rebecca-theme org-mime exotica-theme ghub org-category-capture dockerfile-mode sql-indent sunburn-theme evil-surround unfill ob-restclient madhat2r-theme fuzzy flycheck-credo company-restclient know-your-http-well reason-mode utop tuareg caml ocp-indent merlin org-mind-map monokai-theme autothemer csv-mode wrap-region harvest rainbow-mode rainbow-identifiers color-identifiers-mode wgrep-ag 0blayout ox-reveal company-flow flycheck-flow ac-capf solarized-theme yaml-mode ws-butler volatile-highlights uuidgen smartparens rainbow-delimiters move-text lorem-ipsum link-hint indent-guide hungry-delete highlight-parentheses highlight-numbers parent-mode highlight-indentation hide-comnt expand-region eval-sexp-fu highlight column-enforce-mode clean-aindent-mode auto-highlight-symbol aggressive-indent adaptive-wrap toc-org org-plus-contrib org-bullets projectile-rails inflections feature-mode ag spaceline powerline popwin neotree hl-todo golden-ratio fill-column-indicator fancy-battery persp-mode eyebrowse mwim zonokai-theme zenburn-theme zen-and-art-theme xterm-color wolfram-mode web-mode web-beautify vagrant-tramp vagrant underwater-theme ujelly-theme twilight-theme twilight-bright-theme twilight-anti-bright-theme tronesque-theme toxi-theme toml-mode thrift tao-theme tangotango-theme tango-plus-theme tango-2-theme tagedit sunny-day-theme sublime-themes subatomic256-theme subatomic-theme stekene-theme stan-mode spacegray-theme soothe-theme soft-stone-theme soft-morning-theme soft-charcoal-theme smyx-theme smeargle slim-mode shell-pop seti-theme scss-mode scad-mode sass-mode reverse-theme restclient railscasts-theme racket-mode faceup racer qml-mode purple-haze-theme pug-mode psci purescript-mode psc-ide professional-theme planet-theme phoenix-dark-pink-theme phoenix-dark-mono-theme pastels-on-dark-theme orgit organic-green-theme org-projectile org-present org-pomodoro alert log4e gntp org-download omtose-phellack-theme oldlace-theme occidental-theme obsidian-theme ob-http org noctilux-theme niflheim-theme naquadah-theme mustang-theme multi-term monochrome-theme molokai-theme moe-theme mmm-mode minimal-theme matlab-mode material-theme markdown-toc markdown-mode majapahit-theme magit-gitflow lush-theme livid-mode skewer-mode simple-httpd light-soap-theme less-css-mode json-mode json-snatcher json-reformat js2-refactor multiple-cursors js2-mode js-doc jbeans-theme jazz-theme ir-black-theme intero inkpot-theme idris-mode prop-menu htmlize hlint-refactor hindent heroku-theme hemisu-theme hc-zenburn-theme haskell-snippets haml-mode gruvbox-theme gruber-darker-theme grandshell-theme gotham-theme gnuplot gitignore-mode gitconfig-mode gitattributes-mode git-timemachine git-messenger git-link gh-md gandalf-theme flyspell-correct-ivy flyspell-correct flycheck-rust seq flycheck-pos-tip pos-tip flycheck-mix flycheck-haskell flycheck-elm flycheck flatui-theme flatland-theme firebelly-theme farmhouse-theme evil-magit magit magit-popup git-commit with-editor ess-smart-equals ess-R-object-popup ess-R-data-view ctable ess julia-mode espresso-theme eshell-z eshell-prompt-extras esh-help erlang emmet-mode elm-mode dracula-theme django-theme dash-at-point darktooth-theme darkokai-theme darkmine-theme darkburn-theme dakrone-theme cyberpunk-theme counsel-dash helm-dash company-web web-completion-data company-tern dash-functional tern company-statistics company-ghci company-ghc ghc haskell-mode company-cabal colorsarenice-theme color-theme-sanityinc-tomorrow color-theme-sanityinc-solarized coffee-mode cmm-mode clues-theme cherry-blossom-theme cargo rust-mode busybee-theme bubbleberry-theme birds-of-paradise-plus-theme badwolf-theme auto-yasnippet yasnippet auto-dictionary arduino-mode apropospriate-theme anti-zenburn-theme ample-zen-theme ample-theme alect-themes alchemist company elixir-mode afternoon-theme ac-ispell auto-complete rvm ruby-tools ruby-test-mode rubocop rspec-mode robe rbenv rake f s minitest chruby bundler inf-ruby which-key wgrep use-package smex pcre2el macrostep ivy-hydra hydra help-fns+ helm-make helm helm-core popup flx exec-path-from-shell evil-visualstar evil-escape evil goto-chg undo-tree elisp-slime-nav diminish counsel-projectile projectile pkg-info epl counsel swiper ivy bind-map bind-key auto-compile packed dash async ace-window avy quelpa package-build spacemacs-theme))
 '(pdf-view-midnight-colors '("#dedded" . "#4A4159"))
 '(pos-tip-background-color "#A6E22E")
 '(pos-tip-foreground-color "#272822")
 '(psc-ide-add-import-on-completion t t)
 '(psc-ide-rebuild-on-save nil t)
 '(racer-rust-src-path "/Users/sylvie/.rust/rust/src")
 '(rustic-ansi-faces
   ["#E5E9F0" "#99324B" "#4F894C" "#9A7500" "#3B6EA8" "#97365B" "#398EAC" "#3B4252"])
 '(safe-local-variable-values
   '((encoding . utf-8)
     (elixir-enable-compilation-checking . t)
     (elixir-enable-compilation-checking)))
 '(smartrep-mode-line-active-bg (solarized-color-blend "#859900" "#eee8d5" 0.2))
 '(standard-indent 2)
 '(term-default-bg-color "#fdf6e3")
 '(term-default-fg-color "#657b83")
 '(tool-bar-mode nil)
 '(vc-annotate-background "#433844")
 '(vc-annotate-background-mode nil)
 '(vc-annotate-color-map
   '((20 . "#BC8383")
     (40 . "#CC9393")
     (60 . "#DFAF8F")
     (80 . "#D0BF8F")
     (100 . "#E0CF9F")
     (120 . "#F0DFAF")
     (140 . "#5F7F5F")
     (160 . "#7F9F7F")
     (180 . "#8FB28F")
     (200 . "#9FC59F")
     (220 . "#AFD8AF")
     (240 . "#BFEBBF")
     (260 . "#a7a6d4")
     (280 . "#676694")
     (300 . "#777694")
     (320 . "#8786b4")
     (340 . "#9796c4")
     (360 . "#b48ead")))
 '(vc-annotate-very-old-color "#b48ead")
 '(web-mode-markup-indent-offset 2 t)
 '(weechat-color-list
   (unspecified "#272822" "#20240E" "#F70057" "#F92672" "#86C30D" "#A6E22E" "#BEB244" "#E6DB74" "#40CAE4" "#66D9EF" "#FB35EA" "#FD5FF0" "#74DBCD" "#A1EFE4" "#F8F8F2" "#F8F8F0"))
 '(xterm-color-names
   ["#eee8d5" "#dc322f" "#859900" "#b58900" "#268bd2" "#d33682" "#2aa198" "#073642"])
 '(xterm-color-names-bright
   ["#fdf6e3" "#cb4b16" "#93a1a1" "#839496" "#657b83" "#6c71c4" "#586e75" "#002b36"]))
(custom-set-faces
 ;; custom-set-faces was added by Custom.
 ;; If you edit it by hand, you could mess it up, so be careful.
 ;; Your init file should contain only one such instance.
 ;; If there is more than one, they won't work right.
 '(default ((t (:background nil :family "Fira Code" :foundry "nil" :slant normal :weight normal :height 160 :width normal)))))
)
