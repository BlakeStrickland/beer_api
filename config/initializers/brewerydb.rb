key = ENV['BEER_KEY']
BreweryDB::Client.new do |config|
  config.api_key = key
end
