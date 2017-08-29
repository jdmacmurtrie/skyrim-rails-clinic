class QuestsController < ApplicationController
  def create
    @dragonborn = Dragonborn.find(params[:dragonborn_id])
    @quest = Quest.create(quest_params)
    @quest.dragonborn = @dragonborn
    if @quest.save
      redirect_to dragonborn_path(@dragonborn)
      flash[:notice] = "New quest accepted."
    else
      render :'dragonborns/show'
      flash[:notice] = @quest.errors.full_messages.join(',')
    end
  end

  def destroy
    @quest = Quest.find(params[:id])
    @selected_dragonborn = Dragonborn.find(params[:dragonborn_id])
    @quest.destroy
    redirect_to @selected_dragonborn
  end

  private

  def quest_params
    params.require(:quest).permit(:quest_giver, :task)
  end
end
