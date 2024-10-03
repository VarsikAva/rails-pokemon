class PokeballsController < ApplicationController
  def create
    @pokemon = Pokemon.find(params[:pokemon_id])
    @pokeball = Pokeball.new(pokeball_params)
    @pokeball.pokemon = @pokemon
    if @pokeball.save
      redirect_to pokemon_path(@pokemon), notice: 'Pokemon caught!'
    else
      render 'pokemons/show'
    end
  end

  private

  def pokeball_params
    params.require(:pokeball).permit(:location, :trainer_id, :caught_at)
  end
end
