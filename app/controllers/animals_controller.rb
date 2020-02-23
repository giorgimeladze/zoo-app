class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show,:edit,:update,:destroy]

  def search

  end

  def result
    @specie = params[:category]
    @input = params[:q]

    if @input.blank?
      flash[:notice] = "Can't be blank"
      render :search
    else
      if @specie == "specie"
        @animals = Animal.search_specie(@input, current_user).paginate(page: params[:page], per_page: 7)
      elsif @specie == "color"
        @animals = Animal.search_color(@input, current_user).paginate(page: params[:page], per_page: 7)
      else
        @animals = Animal.search_sex(@input, current_user).paginate(page: params[:page], per_page: 7)
      end
    end
  end

  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)
    @animal.user = current_user

    if @animal.save
      flash[:notice] = "Animal was successfully added"
      redirect_to animals_path
    else
      flash[:danger] = "Something went wrong"
      render :new
    end
  end

  def index
    @animals = current_user.animals.to_a.sort_by { |animal| -animal.quantity}
    @animals = @animals.paginate(page: params[:page], per_page: 7)
  end

  def show
  end

  def edit
  end

  def update
    if @animal.update(animal_params)
      flash[:notice] = "Animal's parameters were successfully updated"
      redirect_to animal_path(@animal)
    else
      flash[:danger] = "There was error"
      render :edit
    end
  end

  def destroy
    @animal.destroy
    flash[:notice] = "Animal wass successfully removed from your private zoo"
    redirect_to animals_path
  end

  private

  def set_animal
    @animal = Animal.find(params[:id])
  end

  def animal_params
    params.require(:animal).permit(:specie,:color,:age,:quantity,:sex)
  end

end
