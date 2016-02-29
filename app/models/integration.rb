class Integration
  attr_reader :brew_api, :name, :albums
  def initialize(abv: nil,artist: nil)
    # @song_api = HTTParty.get("https://api.spotify.com/v1/search?q=%22#{artist}%22&type=artist")

    @brew_api = HTTParty.get("http://api.brewerydb.com/v2/beers/?abv=#{abv}&key=#{ENV['BEER_KEY']}")

    @albums = HTTParty.get("https://api.spotify.com/v1/search?q=%22#{artist}%22&type=album")

    # @beers = HTTParty.get("")

  end

  def album_results
    @genre = @song_api['artists']['items'].first['genres']
    # @albums = HTTParty.get("https://api.spotify.com/v1/search?q=#{@name}&%22&type=artist")
  end
end
