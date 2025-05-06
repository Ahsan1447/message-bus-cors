# name: message-bus-cors
# about: Adds custom CORS headers to MessageBus if enabled
# version: 0.1
# authors: Ahsan Afzal

after_initialize do
  MessageBus.extra_response_headers_lookup do |env|
    setup_message_bus_env(env)
    headers = env["__mb"][:extra_headers]
    headers["Access-Control-Allow-Origin"] = "https://community-stg.wowpowers.com/wow-community"
    headers["Access-Control-Allow-Methods"] = "GET, POST, OPTIONS"
    headers
  end
end