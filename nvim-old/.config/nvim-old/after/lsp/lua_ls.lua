local lazydev = require('lazydev')
return {
  root_dir = function(bufnr, on_dir) on_dir(lazydev.find_workspace(bufnr)) end
}
