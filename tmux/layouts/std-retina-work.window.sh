# Set window root path. Default is `$session_root`.
# Must be called before `new_window`.
window_root "~/school/"

# Create new window. If no argument is given, window name will be based on
# layout file name.
new_window

split_h 55
select_pane 1
split_v 23
select_pane 0
split_v 23

# Set active pane.
select_pane 2
run_cmd "vim"
