class AnimalsController < ApplicationController

  def create
    @animal = Animal.new(animal_params)
    tag_list = params[:animal][:name].split(',')
    if @animal.save
      @animal.save_tag(tag_list)
      redirect_to zoos_path(@animal), notice:'投稿完了'
    else
      redirect_to zoos_path(@animal), notice: '投稿失敗'
    end
  end

  def index
    @tags = Tag.all
    @animals = Animal.all
    # @animal = Animal.find(params[:animal_id])
    if params[:search].present?
      animals = Animal.animals_search(params[:search])
    else params[:tag_id].present?
      # @tag = Tag.find(params[:tag_id])
      # animals = @tag.animals.order(created_at: :desc)
    end
  end

  def show
    @animal = Animal.find(params[:id])
    @animal_tag = AnimalTag.new
    @tag_animal = @animal.tags
  end


  private

  def animal_params
    params.require(:animal).permit(:name, :introduction, :image, :tag)
  end

end
