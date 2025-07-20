function __check_and_activate_venv --on-event fish_prompt
    if not set -q VIRTUAL_ENV
        if test -f ./venv/bin/activate.fish
            source ./venv/bin/activate.fish
        else if test -f ./.venv/bin/activate.fish
            source ./.venv/bin/activate.fish
        end
    end
end