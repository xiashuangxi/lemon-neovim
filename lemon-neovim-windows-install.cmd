
@if not exist "%HOME%" @set HOME=%HOMEDRIVE%%HOMEPATH%
@if not exist "%HOME%" @set HOME=%USERPROFILE%

@set LEMON_VIM_APP_HOME=%HOME%\.lemon-vim

if not EXIST "%LEMON_VIM_APP_HOME%" (
    call git clone https://github.com/xiashuangxi/lemon-neovim.git "%LEMON_VIM_APP_HOME%"
) else (
    @set ORIGINAL_DIR=%CD%
    echo Update lemon-vim
    chdir /d "%LEMON_VIM_APP_HOME%"
    call git pull
    chdir /d "%ORIGINAL_DIR%"
    call cd "%LEMON_VIM_APP_HOME%"
)

call mklink "%HOME%\AppData\Local\nvim" "%LEMON_VIM_APP_HOME%"
