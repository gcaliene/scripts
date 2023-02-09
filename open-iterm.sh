#!/bin/bash

osascript<<EOF
    tell application "iTerm"
        activate
        select first window

        # Create new tab
        tell current window
            create tab with default profile
        end tell

        # Split pane
        tell current session of current window
            split vertically with default profile
        end tell

        # Run command in Pane-1
        tell first session of current tab of current window
            write text "/Applications/zoom.us.app/Contents/MacOS/zoom.us"
        end tell

        # Run command in Pane-2
        tell second session of current tab of current window
            write text "~/code/scripts/tutor-2u.sh"
        end tell

    end tell
EOF