if status is-login
    fish_add_path /opt/local/sbin
    fish_add_path /opt/local/bin
    fish_add_path /Library/TeX/texbin
    fish_add_path ~/bin
end

mise activate fish | source

if status is-interactive
    starship init fish | source
end
