> TODO-NOW

Improve text editing
================================================
	- Finish "Key Bindings" website
	- Refactor mappings
		- Prune mappings that are not very useful
		- Choose "perfect" keys using website
		- Move RHS of complicated mappings into autoloaded functions?
		- Toggling wrap/spell/list/etc. takes too many keypresses? (use \ prefix?)
		- Window commands take too many keypresses? (use alt?)
		- Create mapping "sub-modes"?
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
	- Read "Modern Vim"
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
	- Improve fzf
		- Optimize :Files and :History for file-paths like nixprime/cpsm. Compare with Sublime and Webstorm
		- Report bug: sometimes text is scrolled out of view (https://github.com/junegunn/fzf.vim/issues/385)
		- Learn to use fzf with custom lists for everything
	- Improve folding
		- Add pseewald/vim-anyfold
	- Better %
		- Add andymass/vim-matchup
	- Project management
		- Add ability to easily do a project-wide search, followed by a project-wide replace
		- tpope/vim-projectionist
	- Customize existing plugins
	- Show search index (google/vim-searchindex)
	- Move vim-plug out of repo
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
