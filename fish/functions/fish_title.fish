# https://fishshell.com/docs/current/cmds/fish_title.html
function fish_title
    # current command
    set -l command (status current-command)

    if test $PWD = $HOME
      echo "~ ($command)"
    else
      echo "$(basename $PWD) ($command)"
    end
end
