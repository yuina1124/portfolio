class AnimalsController < ApplicationController

  def index
    @animals = Animal.all
    if params[:search].present?
      animals = Animal.animals_search(params[:search])
    else params[:tag_id].present?
      @tag = Tag.find(params[:tag_id])
      animals = @tag.animals.order(created_at: :desc)
    end
    @tags = Tag.all
  end

  def create
    @animal = Animal.new(animal_params)
    tags = params[:animal][:tag_name].split(nil)
    @animal.image.attach(params[:animal][:image])
    @animal.zoo.user_id = current_user.id
    if @animal.save
      @animal.save_animals(tag_list)
      redirect_to zoos_path
    else
      flash.now[:alert] = '検索できません'
      render 'index'
    end
  end

  private

  def animal_params
    params.require(:animal).permit(:name, :introduction, :image)
  end

end
