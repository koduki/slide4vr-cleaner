require 'json'
require 'open-uri'

URL="https://slide4vr-api-dnb6froqha-uc.a.run.app"
INPUT_FILE=ARGV[0]
OUTPUT_FILE=ARGV[1]

urls = JSON.parse(open(INPUT_FILE).read)["urls"]
result = urls.map do |x| 
    begin
        status = URI.open("#{URL}#{x}").status 
        [status[0], x]
    rescue OpenURI::HTTPError => e
        ["404", nil]
    end
end

verified_urls = result.find_all{|xs| xs[0] == "200"}.map{|xs| xs[1]}

File.open(OUTPUT_FILE, mode = "w"){|f|
  f.write(JSON.generate({"urls" => verified_urls}))
}

puts "Cleanup: #{urls.size - verified_urls.size}"