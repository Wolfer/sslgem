
$stderr.sync = true
$stdout.sync = true

puts "=============================="
puts "|       testing sslgem       |"
puts "=============================="

$:.unshift File.join(File.dirname(__FILE__))

puts ">> Loading gem..."
require 'sslgem'
puts ">> Loading gem...    OK"

puts "\n>> Creating ssl instance..."
ssl = SslGem.new
puts ">> Creating ssl instance... OK"

puts ">> Begin test"
begin
    
    puts "\n  >> Generate digest 1..."
    dgst = ssl.dgst("/home/jerry/devel/examples/keys/seckey.pem", "11111111") 
    puts "  >> Result OK #{dgst}"
    
    puts "\n  >> Generate digest 2..."
    dgst = ssl.dgst("/home/jerry/devel/examples/keys/seckey.pem", "22222222")
    puts "  >> Result OK #{dgst}"
    
    begin
        puts "\n  >> Generate digest with invalid key..."
        dgst = ssl.dgst("/home/jerry/devel/examples/keys/seckey.pem1", "11111111")
        raise "it must be impossible to generate digest"
    rescue SslGem::Error => e
        puts "  >> Result OK"
    end
    
    puts "\n>> Test COMPLETED"

rescue => e
    puts "\n>> Test FAILED by exception:"
    puts e.inspect
end

