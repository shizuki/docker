#!/bin/sh

echo "CREATE DATABASE IF NOT EXISTS \`"${MYSQL_DATABASE}"\` ;" | "${mysql[@]}"
echo "GRANT ALL ON \`"${MYSQL_DATABASE}"\`.* TO '"${MYSQL_USER}"'@'%' ;" | "${mysql[@]}"
echo 'FLUSH PRIVILEGES ;' | "${mysql[@]}"

echo "CREATE DATABASE IF NOT EXISTS \`"${MYSQL_DATABASE}_test"\` ;" | "${mysql[@]}"
echo "GRANT ALL ON \`"${MYSQL_DATABASE}_test"\`.* TO '"${MYSQL_USER}"'@'%' ;" | "${mysql[@]}"
echo 'FLUSH PRIVILEGES ;' | "${mysql[@]}"
