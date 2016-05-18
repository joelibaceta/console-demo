require 'sinatra'
require 'rubygems'  

require 'tempfile'
require 'open3'
require 'json'
require 'sinatra/cross_origin'

configure do
  enable :cross_origin
end

get '/' do
  "Hello World!"
end

post '/execute' do
  
  cross_origin 
  
  p request
  
  code=request.params["ruby_code"] 
  
  file=File.new('random.rb', 'w')
  
  file.puts <<-EOF 
    load 'lib/mp-sdk-ruby/lib/mercadopago.rb'
    
  EOF
  
  file.puts(code)
  file.close
  
  stdin, stdout, stderr = Open3.popen3("ruby -W1 " + File.expand_path(__dir__) + "/random.rb")
   
  
  stdout_str = stdout.readlines
  stderr_str = stderr.readlines
   
  
  return {stdout: stdout_str.to_json, stderr: stderr_str.to_json}.to_json

end

 