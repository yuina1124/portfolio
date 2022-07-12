class ZoosController < ApplicationController

  def index
    @tags = Tag.all
    @animals = Animal.all
  end

  def create
    @animal = Animal.new(@animal)
    @animal.user_id = current_user.id
    tag_list = params[:zoo][:name].split(',')
    if @animal.save
      @animal.save_tag(tag_list)
      redirect_to user_path(current_user),notice:'投稿完了'
    else
      render:new
    end
  end

  private

  def zoo_params
    params.require(:zoo).permit(:name, :favorite, :type, :many, :assessment, :address, :image)
  end


end