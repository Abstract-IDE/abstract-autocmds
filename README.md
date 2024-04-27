Useful autocmds for Neovim.

# Installation and Uses.

### using lazy.nvim
All commands are disabled by default.
```lua
	
{
	"Abstract-IDE/abstract-autocmds",
	lazy = false,
	config = function()
		require("abstract-autocmds").setup({
			auto_resize_splited_window = true,
			remove_whitespace_on_save = true,
			no_autocomment_newline = true,
			clear_last_used_search = true,
			open_file_last_position = true,
			highlight_on_yank = {
				enable = true,
				opts = {
					timeout = 150,
				},
			},
			give_border = {
				enable = true,
				opts = {
					pattern = { "null-ls-info", "lspinfo" },
				},
			},
			smart_dd = true,
			visually_codeblock_shift = true,
			move_selected_upndown = true,
			go_back_normal_in_terminal = true,
			ctrl_backspace_delete = false,
			smart_visual_paste = true,
			dont_suspend_with_cz = true,
			smart_save_in_insert_mode = true,
			scroll_from_center = true,
		})
	end,
}
```


# Available autocmds

Automatically resizes split windows in tabs to maintain equal sizes when the Vim window is resized.

```lua
auto_resize_splited_window = true
```

Removes trailing whitespace from each line when saving a buffer

```lua
remove_whitespace_on_save = true
```

Prevents Neovim from automatically adding comments to new lines when entering a buffer or changing its file type.

```lua
no_autocomment_newline = true
```

Clears the last used search pattern when entering a buffer window

```lua
clear_last_used_search = true
```

Jumps to the last cursor position when reopening a file

```lua
open_file_last_position = true
```

Highlights text when yanked in Neovim, using the specified timeout and applying the highlighting to the "Search" highlight group.

```lua
highlight_on_yank = {
    enable = true,
    opts = {
        timeout = 150,
    },
}
```

Enables border decoration for specific patterns

```lua
give_border = {
    enable = true,
    opts = {
        pattern = { "null-ls-info", "lspinfo" },
    },
}
```

smart deletion functionality for the "dd" command. If the current line is empty, it deletes the line without affecting the yank register. Otherwise, it behaves like the standard "dd" command.

```lua
smart_dd = true
```

Facilitates the movement of code blocks by allowing users to enter visual mode (v), select several lines of code, and then press ">" or "<" several times to shift the selected block of code.

```lua
visually_codeblock_shift = true
```

Enables moving the selected line(s) up or down in visual mode. Pressing "J" moves the selected lines down, while "K" moves them up.

```lua
move_selected_upndown = true
```

Provides a way to return to normal mode within Neovim's terminal, ensuring compatibility with plugins like floaterm. It maps the Escape key in terminal mode to the key sequence <c-\><c-n>, which switches back to normal mode.

```lua
go_back_normal_in_terminal = true
```

Enables deleting a word backward in insert mode using Ctrl+Backspace.

```lua
ctrl_backspace_delete = true
```

Enhances visual mode ('x') behavior so that pressing 'p' replaces the selected text with the content of the default register, effectively pasting the last deleted or yanked text.

```lua
smart_visual_paste = true
```

Prevents Neovim from suspending with Ctrl+Z when entering a buffer, ensuring that it doesn't suspend the terminal.

```lua
dont_suspend_with_cz = true
```

Enables saving the buffer when it has been modified, triggered by pressing Ctrl+S in insert mode or normal mode.

```lua
smart_save_in_insert_mode = true
```

Enhances scrolling behavior in normal mode, allowing scrolling up/down from the center of the screen.

```lua
scroll_from_center = true
```

