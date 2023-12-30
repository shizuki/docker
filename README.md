# PHP + nginx + mariadb + minio for WSL2

- nginx/php-fpm共にDockerfileでUID/GID1000のユーザにて運用
- 作成したユーザのホームディレクトリ下に公開ディレクトリを設定
- minio/mariadbは調整中
