class Beer
  attr_reader :total_beer_list
  def initialize(abv: 8)
    @total_beer_list = HTTParty.get("http://api.brewerydb.com/v2/beers/?abv=#{abv}&key=#{ENV['BEER_KEY']}")
    # file = File.read('beer.json')
    # @data_hash = JSON.parse(file)
  end



  def token

  end
end
