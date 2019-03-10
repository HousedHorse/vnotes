" display an error if no python support
if !has('python3')
echo "Error: Required vim compiled with +python3"
finish
endif

" import python code
let s:plugin_root_dir = fnamemodify(resolve(expand('<sfile>:p')), ':h')
python << EOF
import sys
from os.path import normpath, join
import vim
plugin_root_dir = vim.eval('s:plugin_root_dir')
python_root_dir = normpath(join(plugin_root_dir, '..', 'python'))
sys.path.insert(0, python_root_dir)
from operations import *
EOF

" fold a section
function! s:fold_section()
    python fold_section()
endfunction

nmap <leader>f :call <SID>fold_section()<CR>
