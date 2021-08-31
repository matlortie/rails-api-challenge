require 'rails_helper'

RSpec.describe "Pokemons API", type: :request do

  # initialize test data
  let!(:pokemons) { create_list(:pokemon, 10) }
  let(:pokemon_id) { pokemons.first.id }

  # Test suite for GET /pokemons
  describe 'GET /pokemons' do
    # make HTTP get request before each example
    before { get '/pokemons' }

    it 'returns pokemons' do
      # Note `json` is a custom helper to parse JSON responses
      expect(json).not_to be_empty
      expect(json.size).to eq(10)
    end

    it 'returns status code 200' do
      expect(response).to have_http_status(200)
    end
  end

  # Test suite for GET /pokemons/:id
  describe 'GET /pokemons/:id' do
    before { get "/pokemons/#{pokemon_id}" }

    context 'when the record exists' do
      it 'returns the pokemon' do
        expect(json).not_to be_empty
        expect(json['id']).to eq(pokemon_id)
      end

      it 'returns status code 200' do
        expect(response).to have_http_status(200)
      end
    end

    context 'when the record does not exist' do
      let(:pokemon_id) { 100 }

      it 'returns status code 404' do
        expect(response).to have_http_status(404)
      end

      it 'returns a not found message' do
        expect(response.body).to match(/Couldn't find Pokemon/)
      end
    end
  end

  # Test suite for POST /pokemons
  describe 'POST /pokemons' do
    # valid payload
    let(:valid_attributes) { { name: 'New Pokemon', number: 801 } }

    context 'when the request is valid' do
      before { post '/pokemons', params: valid_attributes }

      it 'creates a pokemon' do
        expect(json['name']).to eq('New Pokemon')
      end

      it 'returns status code 201' do
        expect(response).to have_http_status(201)
      end
    end

    context 'when the request is invalid' do
      before { post '/pokemons', params: { number: 801 } }

      it 'returns status code 422' do
        expect(response).to have_http_status(422)
      end

      it 'returns a validation failure message' do
        expect(response.body)
          .to match("{\"message\":\"Validation failed: Name can't be blank\"}")
      end
    end
  end

  # Test suite for PUT /pokemons/:id
  describe 'PUT /pokemons/:id' do
    let(:valid_attributes) { { name: 'New Name' } }

    context 'when the record exists' do
      before { put "/pokemons/#{pokemon_id}", params: valid_attributes }

      it 'updates the record' do
        expect(response.body).to be_empty
      end

      it 'returns status code 204' do
        expect(response).to have_http_status(204)
      end
    end
  end

  # Test suite for DELETE /pokemons/:id
  describe 'DELETE /pokemons/:id' do
    before { delete "/pokemons/#{pokemon_id}" }

    it 'returns status code 204' do
      expect(response).to have_http_status(204)
    end
  end

end
