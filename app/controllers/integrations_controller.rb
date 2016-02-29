class IntegrationsController < ApplicationController
  def show
    i = Integration.new(abv: params[:abv], artist: params[:artist])
    albums = []

    i.albums.each do |x|
      x[1]['items'].each do |i|
        albums << i['name']
      end
    end
    url = []
    i.albums.each do |x|
      x[1]['items'].each do |x|
        url << x['external_urls']['spotify']
      end
    @url = url
  end


    @albums = albums.uniq
    beer_info = []

    i.brew_api['data'].each do |x|
      beer_info << "#{x["name"]} @ #{x["abv"]} abv."
      @beer_info = beer_info.uniq
    end

    @a = @albums
    @u = @url
    a_and_u = {}
    @album_with_url = @a
    @length = @a.count.to_i

    @b = @beer_info.sample

    number = rand(0..@length)
    @url = "#{@a[number]}; \n #{@u[number]}"
  end

  def index
  end
end
