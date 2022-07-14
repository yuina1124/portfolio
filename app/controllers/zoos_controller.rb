class ZoosController < ApplicationController

  def new
    @zoo = Zoo.new
  end

  def create
    # @zoo = Zoo.new(zoo_params)
    # if @zoo.save
    #   flash[:notice] = "投稿完了"
    #   redirect_to zoo_path(@zoo)
    # else
    #   redirect_to new_zoo_path, alert: "投稿失敗"
    # end
    @zoo = Zoo.new(zoo_params)
    @zoo.users_id = current_user.id
    animal_list =params[:zoo][:name].split(',')
    if @zoo.save
      @zoo.save_animal(animal_list)
      redirect_to zoo_path(@zoo)
    else
      redirect_to new_zoo_path, alert: "投稿失敗"
    end
  end

  def index
     @zoos = Zoo.all
     @animals = Animal.all

  end

  def edit
    @zoo = Zoo.find(params[:id])
    @animal_list = @zoo.animals.pluck(:name).join(',')
  end

  def update
    # zoo = Zoo.find(params[:id])
    # if zoo.update(zoo_params)
    #   flash[:notice] = "修正完了"
    #   redirect_to zoos_path
    # else
    #   redirect_to edit_zoo_path
    # end
    @zoo = Zoo.find(params[:id])
    animal_list = params[:zoo][:name].split(',')
    if @zoo.update(zoo_params)
      @old_relations = ZooAnimal.where(zoo_id: @zoo.id)
      @old_relations.each do |relation|
        relation.delete
      end
      @zoo.save_animal(animal_list)
      redirect_to zoos_path(@zoo.id),notice:'修正完了'
    else
      render:edit
    end
  end

  def show
    @zoo = Zoo.find(params[:id])
    @zoo_animals = @zoo.animals
  end


  private

  def zoo_params
    params.require(:zoo).permit(:animal, :name, :favorite, :type, :many, :assessment, :address, :image, :zoo)
  end

end
