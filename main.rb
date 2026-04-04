require 'net/http'
ip = ARGV[0]
api_key = ENV["ABUSEIPBD_KEY"]
uri = URI("https://api.abuseipdb.com/api/v2/check")
request = Net::HTTP::Get.new(uri)
request["Key"] = api_key
request["Accept"] = "application/json"
Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
  response = http.request(request)
  puts response.body
end