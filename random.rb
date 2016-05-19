   
    
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
    
    
   
    item = MercadoPago::Item.new

    item.unit_price = 4