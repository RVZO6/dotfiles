function update_brew
    echo "Updating Brewfiles..."
    # Execute the Ruby script to regenerate the modular files.
    ruby ~/.config/homebrew/update_brewfiles.rb
end
