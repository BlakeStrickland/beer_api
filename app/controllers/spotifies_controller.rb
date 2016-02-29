class SpotifiesController < ApplicationController
  def show
  end

  def index
    @song_list = Spotify.new("Rise Against")
    render json: @song_list.search_list['artists']['items'][0]['genres']
    artists = []
    @song_list.search_list['artists']['items'].each do |x|
      artists << {x["name"] =>  x['external_urls']['spotify']}
    end
    @artists = artists

    render json: @artists
  end
end
