require 'net/http'
require 'json'
if ARGV.empty?
  puts "Command must be: ruby main.rb ip-address"
  exit
end
ip = ARGV[0]
api_key = ENV["ABUSEIPDB_KEY"]
if api_key.nil?
  puts "API key is not set. Command must be: export ABUSEIPDB_KEY=yourkey"
  exit
end
uri = URI("https://api.abuseipdb.com/api/v2/check")
uri.query = URI.encode_www_form({"ipAddress" => ip , "maxAgeInDays" => 90})
request = Net::HTTP::Get.new(uri)
request["Key"] = api_key
request["Accept"] = "application/json"
Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |http|
  response = http.request(request)
  json_parse = JSON.parse(response.body)
  puts "IP: #{json_parse["data"]["ipAddress"]}"
  puts "Country code: #{json_parse["data"]["countryCode"]}"
  puts "Abuse confidence score: #{json_parse["data"]["abuseConfidenceScore"]}"
  puts "Total reports: #{json_parse["data"]["totalReports"]}"
  puts "Last reported: #{json_parse["data"]["lastReportedAt"]}"
end