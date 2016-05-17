require 'sinatra'
require 'rubygems'  

require 'tempfile'
require 'open3'
require 'json'
require_relative  'lib/mp-sdk-ruby/lib/mercadopago'

get '/' do
  "Hello World!"
end

post '/execute' do
  p request.params["ruby_code"]
  code=request.params["ruby_code"] 
  
  file=File.new('random.rb', 'w')
  
  file.puts <<-EOF 
    #require File.expand_path(__dir__) + '/lib/mp-sdk-ruby/lib/mercadopago' 
    
  EOF
  
  file.puts(code)
  file.close
  
  stdin, stdout, stderr = Open3.popen3("ruby -W1 " + File.expand_path(__dir__) + "/random.rb")
   
  
  stdout_str = stdout.readlines
  stderr_str = stderr.readlines
   
  
  return {stdout: stdout_str.to_json, stderr: stderr_str.to_json}.to_json

end

 