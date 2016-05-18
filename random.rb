    load 'lib/mp-sdk-ruby/lib/mercadopago.rb'
    
puts "Hello world";puts "ola k ase";puts "hello world 2";


preference = MercadoPago::Preference.new
preference.collector_id="202809963"
preference.operation_type="regular_payment"
preference.auto_return="approved"