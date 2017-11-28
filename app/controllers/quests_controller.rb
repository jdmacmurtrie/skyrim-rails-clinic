class QuestsController < ApplicationController
  def create
    @dragonborn = Dragonborn.find(params[:dragonborn_id])
    @quest = Quest.new(quest_params)
    @quest.dragonborn = @dragonborn
    if @quest.save
      redirect_to dragonborn_path(@dragonborn)
      flash[:notice] = 'Quest Added'
    else
      flash.now[:alert] = @quest.errors.full_messages.join(', ')
      render :new
    end
  end

  private

  def quest_params
    params.require(:quest).permit(:task, :quest_giver)
  end
end
