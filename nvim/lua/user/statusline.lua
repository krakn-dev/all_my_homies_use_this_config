vim.cmd(
    "set statusline=\\ %f\\ %m%=@\\ %{expand('%:p:h')==getcwd()?'.':substitute(getcwd(),$HOME,'~','')}\\ \\ \\ %c\\ %l\\ \\ ")
