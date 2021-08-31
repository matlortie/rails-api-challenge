class PokemonsController < ApplicationController
  before_action :set_pokemon, only: [:show, :update, :destroy]

  # GET /pokemons
  def index
    @pokemons = Pokemon.all.page(params[:page]).per(params[:per_page])
    json_response(@pokemons)
  end

  # POST /pokemons
  def create
    @pokemon = Pokemon.create!(pokemon_params)
    json_response(@pokemon, :created)
  end

  # GET /pokemons/:id
  def show
    json_response(@pokemon)
  end

  # PUT /pokemons/:id
  def update
    @pokemon.update(pokemon_params)
    head :no_content
  end

  # DELETE /pokemons/:id
  def destroy
    @pokemon.destroy
    head :no_content
  end

  private

  def pokemon_params
    # whitelist params
    params.permit(:number, :name, :type_1, :type_2, :total, :hp, :attack, :defense, :sp_atk, :sp_def, :speed, :generation, :legendary)
  end

  def set_pokemon
    @pokemon = Pokemon.find(params[:id])
  end
end
