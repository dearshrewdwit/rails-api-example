require 'rails_helper'

RSpec.describe Api::TitlesController, type: :controller do
  describe '#index' do
    context 'success' do
      let!(:player) { create(:player, :champion) }

      it 'returns 200' do
        get :index, params: { player_id: player.id }

        expect(response).to have_http_status(:ok)
      end

      it 'returns a collection with key titles' do
        get :index, params: { player_id: player.id }

        parsed_body = JSON.parse(response.body)

        expect(parsed_body).to have_key("titles")
      end
    end
  end
end
