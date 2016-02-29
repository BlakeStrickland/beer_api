class Spotify
  attr_reader :search_list
  def initialize(key_word)
    @search_list = HTTParty.get("https://api.spotify.com/v1/search?q=%22#{key_word}%22&type=artist")
  end
end
