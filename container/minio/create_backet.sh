#!/bin/sh

# バケット設定情報格納フォルダの作成
mkdir -p /data/.minio.sys/buckets
# バケットポリシーをコピー
cp -r /policies/* /data/.minio.sys/
# バージョン管理ファイルをコピー
cp -r /export/* /data/
# 不要ファイル削除 findコマンドインストールされて無いので一旦コメントアウト
# find /data -name '.DS_Store' -type f -delete
# find /data -name '.gitkeep' -type f -delete
# サーバ起動
/bin/minio server --address :9000 /data --console-address :9001

