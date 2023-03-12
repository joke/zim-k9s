(( ${+commands[k9s]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[k9s]:-"$(${commands[asdf]} which k9s 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_k9s
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion zsh >| $compfile
    print -u2 -PR "* Detected a new version 'k9s'. Regenerated completions."
  fi
} ${0:h}
