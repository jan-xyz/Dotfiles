function fish_title
    # current command
    set -l command (status current-command)

    if test $PWD = $HOME
      echo "~ ($command)"
    else
      echo "$(basename $PWD) ($command)"
    end
end
