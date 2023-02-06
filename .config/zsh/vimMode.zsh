#!/bin/zsh

RPROMPT=''
function zvm_after_select_vi_mode() {
  case $ZVM_MODE in
    $ZVM_MODE_NORMAL)
		RPROMPT="%{$fg_bold[blue]%} [% Normal]% %{$reset_color%}"
    ;;
    $ZVM_MODE_INSERT)
		RPROMPT=''
    ;;
    $ZVM_MODE_VISUAL)
		RPROMPT="%{$fg_bold[yellow]%} [% Visual]% %{$reset_color%}"
    ;;
    $ZVM_MODE_VISUAL_LINE)
		RPROMPT="%{$fg_bold[yellow]%} [% V-Line]% %{$reset_color%}"
    ;;
    $ZVM_MODE_REPLACE)
		RPROMPT="%{$fg_bold[red]%} [% Replace]% %{$reset_color%}"
    ;;
  esac
}
