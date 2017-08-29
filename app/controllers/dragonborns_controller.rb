class DragonbornsController < ApplicationController

  def index
    @dragonborn = Dragonborn.all
  end

  def show
    @selected_dragonborn = Dragonborn.find(params[:id])
    @quests = @selected_dragonborn.quests
    @quest = Quest.new
  end

  def new
    @dragonborn = Dragonborn.new
  end

  def create
    @dragonborn = Dragonborn.create(dragonborn_params)
    if @dragonborn.save
      redirect_to @dragonborn
      flash[:notice] = "A new Dragonborn has appeared."
    else
      render :new
      flash[:notice] = @dragonborn.errors.full_messages.join(',')
    end
  end

  private

  def dragonborn_params
    params.require(:dragonborn).permit(:name, :race, :gender)
  end

end
