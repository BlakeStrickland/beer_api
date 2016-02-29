class IntegrationsController < ApplicationController
  def show
    i = Integration.new(abv: params[:abv], artist: params[:artist])
    albums = []
    i.albums.each do |x|
      x[1]['items'].each do |i|
        albums << i['name']
      end
    end
    @albums = albums.uniq
    beer_info = []

    i.brew_api['data'].each do |x|
      beer_info << "#{x["name"]} @ #{x["abv"]} abv."
      @beer_info = beer_info.uniq
    end

    a = @albums.sample
    b = @beer_info.sample

    s = "#{a} with a(n) #{b}"

    render json: s
  end

  def index
  end
end
