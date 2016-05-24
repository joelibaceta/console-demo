require './lib/mp-sdk-ruby/lib/mercadopago/mpmiddleware'
use MPMiddleware

require './app'
run Sinatra::Application