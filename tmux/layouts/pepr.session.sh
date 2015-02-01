# Set a custom session root path. Default is `$HOME`.
# Must be called before `initialize_session`.
#session_root "~/Projects/pepr"

# Create session with specified name if it does not already exist. If no
# argument is given, session name will be based on layout file name.
if initialize_session "pepr"; then

    # Create a new window inline within session layout definition.
    #new_window "misc"

    # Select the default active window on session creation.
    #select_window 1

    if [[ `system_profiler SPDisplaysDataType | grep Resolution` == *"Retina"* ]]; then
        # Load a defined window layout.
        load_window "std-retina-pepr"
    else
        load_window "std-retina-pepr"
    fi
fi

# Finalize session creation and switch/attach to it.
finalize_and_go_to_session
