class AnimalsController < ApplicationController
  before_action :set_animal, only: [:show,:edit,:update,:destroy]
  def new
    @animal = Animal.new
  end

  def create
    @animal = Animal.new(animal_params)

    if @animal.save
      flash[:notice] = "Animal was successfully added"
      redirect_to root_path
    else
      flash[:danger] = "Something went wrong"
      render :new
    end
  end

  def index
    @animals = Animal.all
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
