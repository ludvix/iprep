# IPrep

IPrep is an IP-address reputation checker made in Ruby, that checks if an IP-address is known to be dangerous.

## Required before
1. You have to sign up and make an API key at https://www.abuseipdb.com/ 
2. Then copy the key and save it on a local file, NEVER SHARE THIS PUBLICLY

## Usage (All platforms)

1. Clone the repo
2. cd repo
3. Make sure ruby is installed on your system
4. Set your API key in the terminal with: 
```bash 
export ABUSEIPDB_KEY=yourkey
``` 
5. Run: 
```bash
ruby main.rb 118.25.6.39
```
---

## Example output 
```bash
IP: 118.25.6.39
Country code: CN
Abuse confidence score: 7
Total reports: 2
Last reported: 2026-03-28T20:38:47+00:00
```