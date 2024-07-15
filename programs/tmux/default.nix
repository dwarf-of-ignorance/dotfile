{lib, config, pkgs, ...}:

{
	programs.tmux= {
		enable = true;
		baseIndex = 1;
		prefix = "M-escape";
		terminal = "screen-256color";
		keyMode = "vi";
		plugins = with pkgs; [
			tmuxPlugins.yank
			tmuxPlugins.vim-tmux-navigator
			tmuxPlugins.tmux-fzf
		];
			extraConfig = #config
			''
			bind-key -T copy-mode-vi v send-keys -X begin-selection
			bind-key -T copy-mode-vi C-v send-keys -X rectangle-toggle
			bind-key -T copy-mode-vi y send-keys -X copy-selection-and-cancel

			# Shift Alt vim keys to switch windows
			bind -n M-h previous-window
			bind -n M-l next-window

			bind -n C-g display-popup -E "ta ~/git"
			bind -n M-w display-popup -E "tmux new-session -A -s scratch"

					'';

	};
}
