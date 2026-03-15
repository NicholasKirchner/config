function fish_tab_title
    set -l host (string split -m1 . $hostname)[1]
    set -l dir (prompt_pwd)
    echo "$USER@$host: $dir"
end

if status is-login
    fish_add_path /opt/local/sbin
    fish_add_path /opt/local/bin
    fish_add_path /Library/TeX/texbin
    fish_add_path ~/bin
end

mise activate fish | source

if status is-interactive
    set -x LSCOLORS GxFxCxDxBxegedabagaced

    fzf --fish | source
    zoxide init fish | source
    starship init fish | source
end

set fish_greeting
