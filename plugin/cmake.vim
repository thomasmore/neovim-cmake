if exists('g:loaded_cmake')
  finish
endif
let g:loaded_cmake = v:true

function! s:match_commands(arg, line, pos)
  return luaeval('require("cmake.commands").match_commands("' .. a:arg .. '")')
endfunction

command! -nargs=* -complete=customlist,s:match_commands CMake lua require('cmake.commands').run_command(<f-args>)
