vim.cmd(
    "set statusline=\\ %F\\ %m%=@\\ %{expand('%:p:h')==getcwd()?'.':substitute(getcwd(),$HOME,'~','')}\\ \\ \\ %l\\ %c\\ \\ ")
