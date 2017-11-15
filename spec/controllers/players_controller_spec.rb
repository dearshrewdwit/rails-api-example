require 'rails_helper'

RSpec.describe Api::PlayersController, type: :controller do
  describe '#index' do
    context 'there are players' do
      before { create(:player, :champion) }

      it 'returns 200' do
        get :index
        expect(response).to have_http_status(:ok)
      end
    end

    context 'there are no players' do
      it 'returns 204' do
        get :index
        expect(response).to have_http_status(:no_content)
      end
    end
  end
end
