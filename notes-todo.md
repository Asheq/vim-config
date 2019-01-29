> TODO-NOW

Improve text editing
================================================
	- Finish "Key Bindings" website (see own todo.txt)
	- Refactor mappings
		- Prune mappings that are not very useful
		- Choose "perfect" keys using website
		- Move RHS of complicated mappings into autoloaded functions?
		- Toggling wrap/spell/list/etc. takes too many keypresses? (use \ prefix?)
		- Window commands take too many keypresses? (use alt?)
		- Create mapping "sub-modes"?
		- [[ and ]] should work like [{ and ]} and [( and ])
		- Reference spacevim key-bindings
		- https://github.com/andymass/vim-matchup
		- "ALT (|META|) acts like <Esc> if the chord is not mapped.
			For example <A-x> acts like <Esc>x if <A-x> does not have an
			insert-mode mapping."
	- Learn how to extend Vim using:
		- VimScript
		- Lua
		- JavaScript
	- Learn Vim/NeoVim API
	- Learn how to create motions, operators, and text objects
		- Add motions
			- tmhedberg/indent-motion (PLUGIN)
			- jeetsukumaran/vim-indentwise (PLUGIN)
		- Add operators
			- Set search register to replace visual-star
			- Populate quickfix list
				- Search in file
				- Search in project
			- tommcdo/vim-exchange (PLUGIN)
		- Add text objects
			- thinca/vim-textobj-between (PLUGIN)
			- Julian/vim-textobj-variable-segment (PLUGIN)
			- saihoooooooo/vim-textobj-space (PLUGIN)
			- zandrmartin/vim-textobj-blanklines (PLUGIN)
			- vimtaku/vim-textobj-keyvalue (PLUGIN)
	- Add other plugins related to text editing:
		- AndrewRadev/switch.vim (PLUGIN)
		- AndrewRadev/splitjoin.vim (PLUGIN)

Improve general experience
================================================
	- Simplify colorscheme
	- Add a dark colorscheme
	- Make UI simpler and more easier to understand at a glanc
	- Read "Modern Vim"
	- It's still hard to tell what buffers I'm deleting
	- Get the best scrolling experience
	- Add bower_components to path automatically somehow
	- I always get lost when using the jump list and change list
	- Use ignorecase and smartcase for * and #?
	- Understand preview-window, quickfix-window, help-window(?)
	- Think about best ways to deal with lists or choices:
		- fzf
		- dirvish or dirvish-like
		- commandline-completion
		- confirm()
		- other options?
	- Improve dirvish
		- Use for most recently-used files
		- Sometimes the cursor floats on the right
		- Make interaction in dirvish and quickfix consistent
		- Improve previewing and navigating, etc.
		- Ignore .DS_Store files
		- https://github.com/mcchrish/nnn.vim
	- Improve fzf
		- Optimize :Files and :History for file-paths like nixprime/cpsm. Compare with Zedd and Sublime and Webstorm
		- Report bug: sometimes text is scrolled out of view (https://github.com/junegunn/fzf.vim/issues/385)
		- Learn to use fzf with custom lists for everything
			- Use fzf for digraphs/unicode
	- Improve folding
		- Add pseewald/vim-anyfold
	- Better %
		- Add andymass/vim-matchup
	- Project management
		- Add ability to easily do a project-wide search, followed by a project-wide replace
		- tpope/vim-projectionist
	- Customize existing plugins
	- Show search index (google/vim-searchindex)
	- Open issues:
		- vim/nvim
			- When foldenable is off, foldcolumn should not show up
			- When statusline overflows, it should use extends/precedes characters instead of < and >
			- Things that plugins do but should be a part of vim core
		- lion.vim
			- Follow up smap issue

Improve IDE experience
================================================
	- Add git integrations
		- chrisbra/vim-diff-enhanced
		- Easily view side-by-side diffs of staged or unstaged changes
		- Show staged or unstaged changes to a file in the window gutter
		- Easily do git tasks like stage, unstage, resolve merge conflicts, etc.
		- Explore magit
	- Get IDE ideas from other vimrcs and other apps
		- Other vimrcs
		- Spacevim
		- Emacs
		- Webstorm
		- Oni
		- VSCode
		- Atom
		- Sublime
	- Add errorlists via :make, :makeprg, and :compiler
	- Add REPL support
	- Add snippets
	- Add code "table of contents" with tagbar
	- Add Emmet for writing HTML
	- Add on-the-fly linting
	- Add Language Server Protocol enhancements (WAIT FOR NEOVIM SUPPORT)
		- Code navigation (go to definition, go to parent function, find inheriting
		  functions, go to uses, etc.)
	- Perfect syntax highlighting via new syntax API (WAIT FOR NEOVIM SUPPORT)
	- Add as-you-type code completion (WAIT FOR NEOVIM SUPPORT)
	- Add debugger integrations (WAIT/ASK FOR NEOVIM SUPPORT)

Improve other workflows
================================================
	- Add ability to view and write email
		- Look at mutt
	- Improve writing
		- https://www.reddit.com/r/vim/comments/53y9wn/a_writer_in_search_of_an_editor_that_lasts_a/
		- Add grammar checking
