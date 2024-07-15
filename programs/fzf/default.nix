{config, ...}:
{
        programs.fzf = {
                enable = true;
                enableBashIntegration = true;
                changeDirWidgetCommand = "fd --type d";
                defaultCommand = "fd";
                fileWidgetCommand = "fd --type f";
                fileWidgetOptions = [
                        "--preview 'bat -n --color always --file-name {} {}'"
                ];
                historyWidgetOptions = [
                        "--exact"
                ];
        };
}
