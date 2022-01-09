require 'rails_helper'

describe "IMC API" , type: :request do
    describe 'GET /imc' do
        it 'list all data' do
            get 'http://localhost:3000/api/v1/imc'

            expect(response).to have_http_status(:ok)  
        end
    end

    describe 'POST /imc' do
        it 'return correct json response' do
            post 'http://localhost:3000/api/v1/imc', params:{information: {height: '1.70', weight: '76'}}
            
            json = JSON.parse(response.body).deep_symbolize_keys
            expect(response).to have_http_status(:created) 
            expect(json).to eq({"imc": 26.3, "classification": "Sobrepeso", "obesity": "I"})
        end
        
    end
end
