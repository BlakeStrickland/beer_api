class SpotifiesController < ApplicationController
  def show
    @song_list = Spotify.new("Rise Against")
    # render json: @song_list.search_list['artists']['items'][0]['genres']
    artists = []
    urls = []
   @song_list.search_list['artists']['items'].each do |x|
      artists << {x["name"] =>  x['external_urls']['spotify']}
    end
    @artists = artists
    @urls = urls

    render json: @artists

  end

  def index
  end
end
