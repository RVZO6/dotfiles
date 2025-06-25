#!/bin/bash

# Kill any existing instance of the script to prevent duplicates
pkill -f "$(basename "$0")" 2>/dev/null

# Initialize previous window count
previous_window_count=$(aerospace list-windows --workspace focused --count)

# Set the orientation for the *next* split action.
# The first real split (for the 2nd window) should be vertical.
next_split_orientation="vertical"

# Arrange windows dynamically
arrange_windows() {
  # Get the current number of windows in the focused workspace
  current_window_count=$(aerospace list-windows --workspace focused --count)

  # Act only when a new window has been added
  if [ "$current_window_count" -gt "$previous_window_count" ]; then

    # Case 1: The very first window.
    # We "prime" the workspace by setting its orientation to horizontal.
    # This ensures the 2nd window will appear beside it.
    if [ "$current_window_count" -eq 1 ]; then
      if aerospace split horizontal; then
        echo "First window. Priming workspace with HORIZONTAL orientation."
      else
        echo "Error: Could not prime workspace."
      fi
    # Case 2: Any subsequent window (2nd, 3rd, 4th...).
    # We use our state variable to apply the correct split and then toggle it.
    elif [ "$current_window_count" -gt 1 ]; then
      if aerospace split "$next_split_orientation"; then
        echo "Created a $next_split_orientation split."

        # Toggle the orientation for the next window
        if [ "$next_split_orientation" = "vertical" ]; then
          next_split_orientation="horizontal"
        else
          next_split_orientation="vertical"
        fi
        echo "Next split will be $next_split_orientation."
      else
        echo "Error: Could not perform '$next_split_orientation' split."
      fi
    fi
  fi

  # Update the previous window count for the next check
  previous_window_count=$current_window_count
}

# Main loop to poll for window changes and arrange them
while true; do
  arrange_windows
  sleep 0.05 # Set polling interval; 50ms is a good default
done
