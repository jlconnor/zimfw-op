(( ${+commands[op]} || ${+commands[asdf]} && ${+functions[_direnv_hook]} )) && () {

  local command=${commands[op]:-"$(${commands[asdf]} which op 2> /dev/null)"}
  [[ -z $command ]] && return 1

  local compfile=$1/functions/_op
  if [[ ! -e $compfile || $compfile -ot $command ]]; then
    $command completion zsh >| $compfile
    print -u2 -PR "* Detected a new version 'op'. Regenerated completions."
  fi
} ${0:h}
