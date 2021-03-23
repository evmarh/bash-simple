#!/bin/bash

goto () {
        echo File "$1" is located in "$1"="$(readlink -f "$1" | xargs dirname)"
        echo Transfering file "$(readlink -f "$1")"
        echo To which Organization?
        read -pr "ORG"
        echo Would you like to transfer the file?
        select yn in "Yes" "No"; do
                case $yn in
                        Yes ) scp "$(readlink -f "$1")" root@127.0.0.1:/var/www/html/WebMigration/"$ORG" && break;;
                        No ) break;;
                esac
        done
}
