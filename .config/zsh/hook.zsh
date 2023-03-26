# List directory after cd
# Use emulate to not mess up anythin
do-ls() {emulate -L zsh; ls;}

# chpwd() is called when cd is called
chpwd_functions+=(do-ls)
