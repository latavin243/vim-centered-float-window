function! CreateCenteredFloatingWindow(widthRate, heightRate)
    let width = float2nr(&columns * widthRate)
    let height = float2nr(&lines * widthRate)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_open_win(s:buf, v:true, opts)
endfunction
