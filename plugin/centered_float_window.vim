function! CreateCenteredFloatingWindow(widthRate, heightRate)
    let width = float2nr(&columns * a:widthRate)
    let height = float2nr(&lines * a:heightRate)
    let top = ((&lines - height) / 2) - 1
    let left = (&columns - width) / 2
    let opts = {'relative': 'editor', 'row': top, 'col': left, 'width': width, 'height': height, 'style': 'minimal'}

    let top = "‚ï≠" . repeat("‚îÄ", width - 2) . "‚ïÆ"
    let mid = "‚îÇ" . repeat(" ", width - 2) . "‚îÇ"
    let bot = "‚ï∞" . repeat("‚îÄ", width - 2) . "‚ïØ"
    let lines = [top] + repeat([mid], height - 2) + [bot]
    let s:buf = nvim_create_buf(v:false, v:true)
    call nvim_buf_set_lines(s:buf, 0, -1, v:true, lines)
    call nvim_open_win(s:buf, v:true, opts)
    set winhl=Normal:Floating
    let opts.row += 1
    let opts.height -= 2
    let opts.col += 2
    let opts.width -= 4
    call nvim_open_win(nvim_create_buf(v:false, v:true), v:true, opts)
    au BufWipeout <buffer> exe 'bw '.s:buf
endfunction
