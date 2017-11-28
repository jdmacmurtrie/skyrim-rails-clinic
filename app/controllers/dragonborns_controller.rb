class DragonbornsController < ApplicationController
  def index
    @dragonborn = Dragonborn.all
  end

  def show
    @selected_dragonborn = Dragonborn.find(params[:id])
    @quests = @selected_dragonborn.quests
  end
end
