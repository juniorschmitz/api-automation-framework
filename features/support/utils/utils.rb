class Utils
  def self.log_response(response)
    puts "#{JSON.pretty_generate(JSON.parse(response.to_s.force_encoding('UTF-8')))}"
  end
end