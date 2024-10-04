if status is-interactive
    # Commands to run in interactive sessions can go here
end

if status --is-login && test (tty) = /dev/tty1
    echo "starting x.."
    startx &> /dev/null
end
