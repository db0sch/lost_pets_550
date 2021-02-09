class PetsController < ApplicationController
  before_action :set_pet, only: [:show, :edit, :update, :destroy]
  # GET /pets/
  def index
    @pets = Pet.all
  end # render "index.html.erb"

  # GET /pets/:id
  # ex: /pets/4
  def show
  end # render "show.html.erb"

  # GET /pets/new
  def new
    @pet = Pet.new
  end # render "new.html.erb"

  # POST /pets/
  # {"pet"=>{"name"=>"Garfield", "address"=>"Lyon", "species"=>"cat", "found_on"=>"2021-02-08"}}
  def create
    @pet = Pet.new(pet_params)
    @pet.save
    redirect_to pet_path(@pet)
  end # No Render ! We have to redirect somewhere else

  # GET /pets/:id/edit
  def edit
  end # render "edit.html.erb"

  # PATCH /pets/:id
  # {"id" => "34", "pet"=>{"name"=>"Garfield", "address"=>"Lyon", "species"=>"cat", "found_on"=>"2021-02-08"}}
  def update
    @pet.update(pet_params)
    redirect_to pet_path(@pet)
  end # No render !

  # DELETE /pets/:id
  def destroy
    @pet.destroy
    redirect_to pets_path
  end

  private

  def set_pet
    @pet = Pet.find(params[:id])
  end

  def pet_params
    params.require(:pet).permit(:name, :address, :species, :found_on)
  end
end
