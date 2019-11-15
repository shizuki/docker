#PHP & Apache on Amazon Linux 2 for WSL2

- デフォルトのec2-userは、WSL2のubuntuに合わせてuid、gid共に1000とした
- EC2の仕様と同じ、パスワード無しのsudoが可能な設定
- curl/git/sudo/shadow-utils/procpsインストール済み
- php.iniはdocker-composeの方で用意してマウントすることを想定
- 基本的にMySQLのコンテナと合わせてLAMP環境として使用することを想定
