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

get '/notifications' do
  p request
end

get '/file/by_id' do
  id = params[:id]
  file = File.read(File.expand_path(__dir__) + "/lib/mp-sdk-ruby/lib/mercadopago/active_rest/lib/active_rest/notification_" + id + "/_.json")
  data_hash = JSON.parse(file)
  return data_hash
end

get '/last_json.json' do
  file = File.read(File.expand_path(__dir__) + "/lib/mp-sdk-ruby/lib/mercadopago/sample/preference.json")
  data_hash = JSON.parse(file)
  return data_hash
end

post '/execute' do
  
  cross_origin 
  
   
  code=request.params["ruby_code"]
  
  p request
  
  file=File.new('virtual_script.rb', 'w')
  
  file.puts <<-EOF 
    
    
    load 'lib/mp-sdk-ruby/lib/mercadopago.rb'
    
    require 'faker'  
    require 'pp'
    
  EOF
  
  file.puts(code)
  file.close
  
  stdin, stdout, stderr = Open3.popen3("ruby -W1 " + File.expand_path(__dir__) + "/virtual_script.rb")
   
  
  stdout_str = stdout.readlines
  stderr_str = stderr.readlines
   
  
  return {stdout: stdout_str.to_json, stderr: stderr_str.to_json}.to_json

end

 
 