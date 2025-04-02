# Fish greeting
function fish_greeting
  # Get current hour and date in one call
  set -l datetime (date "+%H %A, %B %d %H:%M")
  set -l hour (string split ' ' $datetime)[1]
  set -l current_datetime (string join ' ' (string split ' ' $datetime)[2..])

  # Determine greeting based on time
  set -l greeting
  if test $hour -ge 5 -a $hour -lt 12
    set greeting "Good morning"
  else if test $hour -ge 12 -a $hour -lt 18
    set greeting "Good afternoon"
  else
    set greeting "Good evening"
  end

  # Colors
  set -l c_greeting (set_color --bold yellow)
  set -l c_user (set_color cyan)
  set -l c_date (set_color green)
  set -l c_reset (set_color normal)
  set -l fish_symbol (set_color brblue)"<><"$c_reset

  # Output greeting
  echo "$c_greeting$greeting,$c_reset $c_user$USER$c_reset! Today is $c_date$current_datetime$c_reset $fish_symbol"
end

