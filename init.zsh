(( ${+commands[k9s]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[k9s]:-"$(${commands[asdf]} which k9s 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_k9s
  [[ ! -e $compfile || $compfile -ot $command ]] && $command completion zsh >| $compfile
} ${0:h}
