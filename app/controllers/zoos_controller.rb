class ZoosController < ApplicationController

  def new
    @zoo = Zoo.new
  end

  def create
    @zoo = Zoo.new(zoo_params)

    if @zoo.save!
      flash[:notice] = "投稿完了"
      redirect_to zoos_path
    else
      redirect_to new_zoo_path, alert: "投稿失敗"
    end
  end

  def index
    @tags = Tag.all
    @animals = Animal.all
  end

  private

  def zoo_params
    params.require(:zoo).permit(:animal, :name, :favorite, :type, :many, :assessment, :address, :image, :zoo)
  end


end