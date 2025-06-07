# Override fish keybindings
bind --erase --preset \es
bind \e\e 'for cmd in sudo doas please; if command -q $cmd; fish_commandline_prepend $cmd; break; end; end'
