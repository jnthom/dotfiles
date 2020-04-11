shopt -s expand_aliases
shopt -s globstar
alias ut='date +%s' # Unix time

alias find_images_over_2048=$'identify -format "%f %w x %h\n" *.png | awk \'$2>2048 || $4>2048\''

# Usage: run_server server_command port label
function run_server() {
  PORT=${2-8000}
  URL="http://$HOSTNAME:$PORT"
  export SCREEN_WINDOW_NAME_SUFFIX="$3 $URL"
  screen_set_window_title
  trap 'true' SIGINT
  $1 $PORT
  export SCREEN_WINDOW_NAME_SUFFIX=""
}

# Screen-specific functions
if [[ "$TERM" = screen* ]]; then
  # Credit:
  # https://fortmantechtalk.wordpress.com/2013/07/16/linux-screen-command-auto-renumber-your-screens/
  function renumber_screen_windows() {
    screen -X msgminwait 0
    screen -X msgwait 0
    CURRENT_WINDOW=$( screen -Q title )
    MAX_WINDOW=50
    let NEXT="0"

    for CURRENT in $(seq 0 ${MAX_WINDOW}); do
        screen -p ${CURRENT} -Q info >/dev/null 2>&1 && screen -p ${CURRENT} -X number ${NEXT} && let NEXT="${NEXT}+1"
    done

    screen -Q select "${CURRENT_WINDOW}" >/dev/null 2>&1
    screen -X msgminwait 1
    screen -X msgwait 5
  }
fi


# Bash history related stuff
export HISTSIZE=100000                   # big big history
export HISTFILESIZE=100000               # big big history
shopt -s histappend                      # append to history, don't overwrite it
