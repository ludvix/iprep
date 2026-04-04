require 'net/http'
ip = ARGV[0]
api_key = ENV["ABUSEIDPD_KEY"]
uri = URI("https://api.abuseipdb.com/api/v2/check")
request = Net::HTTP::Get.new(uri)
request["Key"] = api_key
request["Accept"] = "application/json"