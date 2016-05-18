require 'sinatra'
require 'rubygems'  

require 'tempfile'
require 'open3'
require 'json'
require 'sinatra/cross_origin'
require 'colorize'

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
  
  
  
  file=File.new('virtual_script.rb', 'w')
  
  file.puts <<-EOF 
    
    
    load 'lib/mp-sdk-ruby/lib/mercadopago.rb'
    
    require 'faker'  
    
  EOF
  
  file.puts(code)
  file.close
  
  stdin, stdout, stderr = Open3.popen3("ruby -W1 " + File.expand_path(__dir__) + "/virtual_script.rb")
   
  
  stdout_str = stdout.readlines
  stderr_str = stderr.readlines
   
  
  return {stdout: stdout_str.to_json, stderr: stderr_str.to_json}.to_json

end

 