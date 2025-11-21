@echo off
cd /d "%~dp0"

:: ===== 把你的私钥写到临时文件 =====
set KEYFILE=%TEMP%\id_rsa_temp_elettronica
> "%KEYFILE%" echo -----BEGIN OPENSSH PRIVATE KEY-----
>>"%KEYFILE%" echo b3BlbnNzaC1rZXktdjEAAAAACmFlczI1Ni1jdHIAAAAGYmNyeXB0AAAAGAAAABAp
>>"%KEYFILE%" echo EC3T/4yzJevTlhV1b/ntAAAAEAAAAAEAAAEXAAAAB3NzaC1yc2EAAAADAQABAAAB
>>"%KEYFILE%" echo AQCWM0jDtNMYCz9CDQXeKDSv2KIwW aGJdnEIx9xjdxUmb4ZiDTMOyiyvP4RtjFm7
>>"%KEYFILE%" echo F9VHaqCZuGzUtd4kWFlkjlZC+/Xbcl2KcuvdPdJV/uqVqiEsqlpwZJpRtoAC+NBj
>>"%KEYFILE%" echo yCll5WTYNc8gqhY/uNUvcqV1+zPTMDO7ZTHOhVCI+DcrFnshklsqUtNdbXRDqUBP
>>"%KEYFILE%" echo CE1ViG9QRcAyKjcDkDf8OXVVffVd8q5u8SlaTpsruan6XlS1yOERalRcy2WfQe84
>>"%KEYFILE%" echo CweU+u7fbrPYkf7cgY37BDacWUuWjE+lorZoSagyvMtOBi9SKWsiELSpeNVZYVWp
>>"%KEYFILE%" echo fSJdLrQ8EhRkR3u52WHO+9vNAAAD0ElujpvaCBSzB6D3Im8O26Sr6kn9oLBWWrx8
>>"%KEYFILE%" echo pbL8iS+UaKqWhYjHCN1mWBK6959MV/+utj1Ne4YLocP0R1O5uICPyto6LBgalBFL
>>"%KEYFILE%" echo UvA/gUlx8BZhm+j/jE8i9tDIPA4OaobEaH4WqA9PEj2N5qx1yerEAXIOuBEoAGfi
>>"%KEYFILE%" echo bwEz/Ob/AU1CQ6Sy+MSY7Zyriv4lJ5iM4QYyStB2VhYWOTHskpNZxDYPeqyzpHpw
>>"%KEYFILE%" echo plK/QPUrenI4Cgy9gCfGDj0mIKyGnvP3ieirtbn9wMD9epTzuFfOJgBBgbBtcxMz
>>"%KEYFILE%" echo PRpRdTgg/PsEwBxPokdCrr8NX8oBwvcPI9cjaif8WNlDnJKhrOqL98opfNynXwS1
>>"%KEYFILE%" echo iMnqHjogPks9oV/lIPIOdmZVpGGxdJtb3H/dGn/mF4Ywa6eEAfmSU099kb/WPHTq
>>"%KEYFILE%" echo 08baxJifVa8+ApvppN956u+0WYSPa/GCjFjZnClYggUbA1aptCj4IJaIdtPy45hp
>>"%KEYFILE%" echo Dy4oFm2m1lQg0tsjGRGPzDaanAd8GDe5ey1msoBUhyZoi1KXKhRpwXfl3K0W5ky6
>>"%KEYFILE%" echo VsB8Yts9sPBltGEJjFo89LydWe7tIojO6mM0/CkjL8CL0q2+JdliNgcMBql3tVwB
>>"%KEYFILE%" echo AFUplAGUtsj+6E6se0ZmB4/E1IZKktItVan2pnUanjfGSl+ahqHQ/PW1FS68meso
>>"%KEYFILE%" echo vdbmaEM1SbnPftmWjeg0U43TzWWvwNDm62d8bmi/8nRf2At0yf6RQS3npcj0FzqQ
>>"%KEYFILE%" echo 71Ru6ObYUp3rBBd5i0ugbRIkkcxRnjCVxXiEUBpaucoVIOEqsL5+hLUUpHAHQm3j
>>"%KEYFILE%" echo pi7s7nHbe3lanQFOuF2XtIE3WTtL4L+T/+hWm0IczGXEQFARjZP5b0EWkgHSLyQu
>>"%KEYFILE%" echo QpgQHCSCYf8cXbj+Jkah8MZhkFDwqX3UQFd+aruFQLXqwyfllBNnq0Jd6AI28PFN
>>"%KEYFILE%" echo YQWo3Jw4Ps78UYoL/9JlNaQ8d4+3SrV60+W41THIiF+uKQJQSTlO2alV0jx8cAjR
>>"%KEYFILE%" echo lIaVSkSZRmjrawXiKEhCIModRMz8oAaVdWdodJu2eUR7LK1u4qb6qTuKPy/dORl5
>>"%KEYFILE%" echo jpUur72PRDm9hSYozd4+tAa2xzwqPriaGO83aX3iGBSlw5371m6KZZIFeg8CZ4Wk
>>"%KEYFILE%" echo tUHUvhiwIWHSlzPMbvnUBrH0HQLRsX4skCLzT1v02Ug5p+U/UOKezaLM1oWSSIPP
>>"%KEYFILE%" echo vUTu2I3FIJznVc3wU9YxRVJMVLi3e0SK6w8gogjd+P1FnJXfBAr8ybydjJu3CfA+
>>"%KEYFILE%" echo XiNLNOdLjK748K0cKInxvEvr8SbWbMXPb8yHQWz/bLf8hCcko7Y=
>>"%KEYFILE%" echo -----END OPENSSH PRIVATE KEY-----
icacls "%KEYFILE%" /inheritance:r
icacls "%KEYFILE%" /grant:r "%USERNAME%:F"

echo 正在拉取最新代码...
git -c core.sshCommand="ssh -i \"%KEYFILE%\" -o StrictHostKeyChecking=no" pull origin main

:: ===== 重点：忽略 .vs 文件夹和临时文件，强制添加真正要上传的内容 =====
git add -A --ignore-errors
:: 或者更狠一点，只加你想要的（推荐）：
:: git add html load.bat update.bat *.html *.js *.css 2>nul

set /p commitMessage=輸入留言信息: 
if "%commitMessage%"=="" set commitMessage=update

git commit -m "%commitMessage%"

echo 正在推送...
git -c core.sshCommand="ssh -i \"%KEYFILE%\" -o StrictHostKeyChecking=no" push origin main

del "%KEYFILE%"

echo.
echo 真的成功了！去 GitHub 刷新看看吧
pause