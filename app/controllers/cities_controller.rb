class CitiesController < ApplicationController

  def show
    @city = City.find(params[:id])
    @quests = @city.quests
  end

end
