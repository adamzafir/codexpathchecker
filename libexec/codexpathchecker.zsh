# Intercept all codex invocations and require confirmation in the current directory.
codex() {
  local cwd reply bold reset red yellow cyan dim black_on_white
  local cols border_line label_text label_pad label_line path_line side_pad

  cwd="$PWD"
  cols=${COLUMNS:-80}
  (( cols < 60 )) && cols=60

  border_line=$(printf '%*s' "$cols" '')
  border_line=${border_line// /#}

  label_text="CODEX WILL RUN HERE"
  label_pad=$(( (cols - ${#label_text}) / 2 ))
  (( label_pad < 0 )) && label_pad=0
  label_line="$(printf '%*s%s' "$label_pad" '' "$label_text")"
  side_pad=$(( (cols - ${#cwd} - 8) / 2 ))
  (( side_pad < 0 )) && side_pad=0
  path_line="$(printf '%*s' "$side_pad" '')"

  if [[ -t 1 ]]; then
    bold=$'\e[1m'
    reset=$'\e[0m'
    red=$'\e[31m'
    yellow=$'\e[33m'
    cyan=$'\e[36m'
    dim=$'\e[2m'
    black_on_white=$'\e[1;30;47m'
  fi

  printf '\n'
  printf '%s%s%s\n' "$dim" "${red}${border_line}" "$reset"
  printf '%s%s%s\n' "$bold" "${red}${label_line}${reset}" "$reset"
  printf '\n'
  printf '%s%s%s%s%s\n' "$path_line" "$bold" "${black_on_white}    ${cwd}    ${reset}" "$reset" ""
  printf '\n'
  printf '%s%sCommand:%s ' "$bold" "$cyan" "$reset"
  printf 'codex'
  if (( $# > 0 )); then
    printf ' %q' "$@"
  fi
  printf '\n\n'

  while true; do
    printf '%s%sProceed? [y/N]: %s' "$bold" "$yellow" "$reset"
    IFS= read -r reply
    case "$reply" in
      [yY]|[yY][eE][sS])
        printf '\n'
        command codex "$@"
        return $?
        ;;
      [nN]|[nN][oO]|'')
        printf '%sCancelled.%s\n' "$red" "$reset"
        return 1
        ;;
      *)
        printf '%sPlease answer yes or no.%s\n' "$yellow" "$reset"
        ;;
    esac
  done
}
