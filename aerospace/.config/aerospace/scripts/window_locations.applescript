tell application "System Events"
  set processesList to (processes whose background only is false)
  set winInfo to {}
  repeat with p in processesList
    repeat with w in (windows of p)
      set {x, y} to position of w
      set {wW, wH} to size of w
      copy (name of p & "|" & name of w & "|" & x & "," & y & "," & wW & "," & wH) to end of winInfo
    end repeat
  end repeat
  return winInfo
end tell
