class BeersController < ApplicationController
attr_reader :beer
  def index
    @beer = Beer.new(abv: params[:abv])
    beer_names = []
    @beer.total_beer_list['data'].each do |x|
      beer_names <<   [name: x['name'],description: x['description'], abv: x['abv']]
    end
    render json: beer_names
  end

  def show
  end
end
