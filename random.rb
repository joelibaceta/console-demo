   
     
    load 'lib/mp-sdk-ruby/lib/mercadopago.rb'
    
    ActiveREST::RESTClient.config do
      http_param :address, MercadoPago::Settings.base_url
      http_param :use_ssl, true
      http_param :ssl_version, nil
      http_param :verify_mode, nil
      http_param :ca_file, nil
    end
    
    MercadoPago::Settings.CLIENT_ID = "3964826791704277"

    MercadoPago::Settings.CLIENT_SECRET = "TcLhELCaYEFzm522gJxua6tBRf0VbSMd"
    
    
   
    preference = MercadoPago::Preference.new


    preference.collector_id = "202809963"

    preference.operation_type = "regular_payment"

    preference.auto_return = "approved"
    
    puts preference.inspect


    item1 = MercadoPago::Item.new


    item1.id = "item-ID-1234"

    item1.title = "Practical Granite Shirt"

    item1.description = "Faker::Lorem.sentence Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed ultricies est sed elit interdum, quis consectetur libero mollis. Phasellus posuere sed eros vel volutpat."

    item1.picture_url = "http://placehold.it/350x150"

    item1.currency_id = "ARS"

    item1.quantity = 2

    item1.unit_price = 14.5


    preference.items = [item1]

    payer = MercadoPago::Payer.new


    payer.name = ""

    payer.surname = ""

    payer.email = ""

    payer.date_created = Time.now

    payer.phone = { "area_code": '323', "number": '234223'}

    payer.identification = { "type": "DNI", "number": "12345678" }

    payer.address = { "street_name": "", "street_number": 4342, "zip_code": "U92393" }


    preference.payer = payer

    #puts preference.inspect

    p preference

    #puts preference.save
    #
    #puts preference.id