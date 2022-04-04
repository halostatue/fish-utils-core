function is:ubuntu -d 'Returns true if the current Linux is an Ubuntu variant'
    is:linux
    or return 1

    lsb_release -i | string match -qir ubuntu
end
