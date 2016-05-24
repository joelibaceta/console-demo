   
    
    load 'lib/mp-sdk-ruby/lib/mercadopago.rb'
    
    require 'faker'
    
    ActiveREST::RESTClient.config do
      http_param :address, MercadoPago::Settings.base_url
      http_param :use_ssl, true
      http_param :ssl_version, nil
      http_param :verify_mode, nil
      http_param :ca_file, nil
    end
    
    MercadoPago::Settings.CLIENT_ID = "6295877106812064"

    MercadoPago::Settings.CLIENT_SECRET = "N8h64ko1SbY2ucyZVmOMyBJN1B82ajZp"
    
    preference = MercadoPago::Preference.new
    
    payer = MercadoPago::Payer.new
    

    item1 = MercadoPago::Item.new
    
    item1.id = "item-ID-1234"

    item1.title = "Practical Granite Shirt"

    item1.description = "Faker::Lorem.sentence Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultricies est sed elit interdum, quis consectetur libero mollis. Phasellus posuere sed eros vel volutpat."

    item1.picture_url = "http://placehold.it/350x150"

    item1.currency_id = "ARS"

    item1.quantity = 2

    item1.unit_price = 14.5


    preference.items = [item1]


    payer.name = ""

    payer.surname = ""

    payer.email = ""


    payer.phone = { "area_code": Faker::PhoneNumber.area_code, "number": Faker::PhoneNumber.cell_phone}

    payer.identification = { "type": "DNI", "number": "12345678" }

    payer.address = { "street_name": Faker::Address.street_name, "street_number": Faker::Address.building_number, "zip_code": Faker::Address.zip_code }

    
    preference.payer = payer
    
    puts preference.to_json
    
    preference.save
    
    puts "PREFERENCE INSPECT"
    puts preference.inspect
    puts "PREFERENCE json"
    puts preference.to_json
    
    puts preference.id
    