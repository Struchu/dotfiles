if exists('loaded_jira')
  finish
endif
let loaded_jira = 1

let s:jira_command = 'jira'
let s:jq_command = 'jq'

function! s:Mention()
  let l:email = inputdialog('E-mail: ')

  if empty(l:email)
    return
  endif

  let l:id = trim(system(s:jira_command . " req '/rest/api/3/user/search?query=" . l:email . "' | " . s:jq_command . " -r '.[0].accountId'"))

  execute "normal! i[~accountid:" . l:id . "]"
endfunction

command! JiraMention call s:Mention()

nnoremap <silent> <Leader>m :JiraMention<CR>
