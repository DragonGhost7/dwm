source /home/$USER/.profile

# opam configuration
test -r /home/$USER/.opam/opam-init/init.sh && . /home/$USER/.opam/opam-init/init.sh > /dev/null 2> /dev/null || true
