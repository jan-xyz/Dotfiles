function fish_greeting --description "Print a random quote in the style of the starship prompt"
    # starship uses palette 7, 8, and 15, which fish names white, brblack, and brwhite
    set -l quotes_file (status dirname)/../greetings.txt
    test -r $quotes_file; or return

    set -l quotes (string match -rv '^\s*$' <$quotes_file)
    set -q quotes[1]; or return

    set -l quote (string split -m1 ' -- ' $quotes[(random 1 (count $quotes))])

    set_color white
    printf \ue0b6
    set_color -b white brblack
    printf ' %s ' $quote[1]
    if set -q quote[2]
        set_color -b brwhite white
        printf \ue0b0
        set_color -b brwhite brblack
        printf ' %s ' $quote[2]
        set_color normal
        set_color brwhite
    else
        set_color normal
        set_color white
    end
    printf \ue0b4
    set_color normal
    echo
end
