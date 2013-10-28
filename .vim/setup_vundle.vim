let run_bundle_install = 0

if !isdirectory(expand("~/.vim/bundle/vundle/"))
  silent !git clone https://github.com/gmarik/vundle ~/.vim/bundle/vundle
  let run_bundle_install = 1
endif

so ~/.vim/load_vundle.vim

if run_bundle_install == 1
  call vundle#installer#new('!','')
  :cq
  so ~/.vimrc
endif
