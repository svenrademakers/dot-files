. /home/svenr/export-esp.sh

if status is-interactive
    # Commands to run in interactive sessions can go here
end

function open_nvim_with_fzf
    set file (fzf)
    if test $status -ne 0
        return
    end

    nvim $file
end

bind \cf open_nvim_with_fzf
alias get_idf='source $HOME/esp-idf/export.fish'
alias get_esprs='source $HOME/export-esp.sh'
# using lightdm now
#if status --is-login && test (tty) = /dev/tty1
#    echo "starting x.."
#    startx &> /dev/null
#end
