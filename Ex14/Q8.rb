File.open(__FILE__, "r") do |file| # __FILE__ corresponds to file that is currently executing
  puts file.read
end
