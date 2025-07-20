function grep --wraps grep
  if command -v rg &> /dev/null
    rg $argv
  else
    command grep $argv
  end
end
