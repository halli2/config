## skim files
_fif() {
  rg --files | sk --preview="bat {} --color=always"
}
## skim and open helix
_hfif() {
  hx $(_fif)
}
