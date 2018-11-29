let g:DocMode_Started = 0

fun! StartDM()
    set tw=72
    let g:DocMode_Started = 1

    echo "DocMode Started"
endfun

fun! StopDM()
    set tw=0
    let g:DocMode_Started = 0

    echo "DocMode Stopped"
endfun

fun! ToggleDM()
    if g:DocMode_Started != 0
        call StopDM()
    else
        call StartDM()
    endif
endfun

command StartDocmode call StartDM()
command StopDocmode call StopDM()
command ToggleDocmode call ToggleDM()
