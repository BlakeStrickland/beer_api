class IntegrationsController < ApplicationController
  def show
    i = Integration.new(abv: params[:abv], artist: params[:artist])
    albums = []
    url = []
    i.albums.each do |x|
      x[1]['items'].each do |i|
        albums << i['name']
        url << i['external_urls']['spotify']
      end
      @url = url
    end
    @albums = albums.uniq
    beer_info = []
    beer_description = []
    i.brew_api['data'].each do |x|
      beer_info << "#{x["name"]} @ #{x["abv"]} abv."
      beer_description << "#{x["description"]}"
      @beer_info = beer_info.uniq
      @beer_description = beer_description.uniq
    end

    @a = @albums
    @u = @url
    a_and_u = {}
    @album_with_url = @a
    @length = @a.count.to_i

    @b = @beer_info.sample

    number = rand(0..@length)
    @album = "#{@a[number]}"
    @url = "#{@u[number]}"
    @description = "#{@beer_description[number]}"

  end

  def index
  end
end
