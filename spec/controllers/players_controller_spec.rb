require 'rails_helper'

RSpec.describe Api::PlayersController, type: :controller do
  describe '#index' do
    context 'success' do
      before { create(:player, :champion) }

      it 'returns 200' do
        get :index

        expect(response).to have_http_status(:ok)
      end
    end
  end

  describe '#show' do
    context 'success' do
      let!(:player) { create(:player, :champion) }
      let(:params) do
        {
          id: player.id,
        }
      end

      it 'returns 200' do
        get :show, params: params
        expect(response).to have_http_status(:ok)
      end
    end

    context 'failure' do
      let!(:player) { create(:player, :champion) }
      let(:params) do
        {
          id: 124232,
        }
      end

      it 'record not found returns 500' do
        get :show, params: params

        expect(response).to have_http_status(:error)
      end
    end
  end

  describe '#create' do
    let(:player_params) do
      {
        player: {
          name: 'Roger Federer',
          age: 36,
          prize_money: 110235682,
          grand_slams: 19
        }
      }
    end

    context 'success' do
      it 'returns 200' do
        post :create, params: player_params

        expect(response).to have_http_status(:ok)
      end
    end

    context 'failure' do
      before { player_params[:player].delete(:name) }

      it 'missing property returns 500' do
        post :create, params: player_params

        expect(response).to have_http_status(:error)
      end
    end
  end

  describe '#update' do
    let!(:player) { create(:player, :champion) }
    let(:player_params) do
      {
        id: player.id,
        player: {
          name: name
        }
      }
    end

    context 'success' do
      let(:name) { "Rafael Nadal" }

      it 'returns 200' do
        patch :update, params: player_params

        expect(response).to have_http_status(:ok)
        expect(player.reload.name).to eq name
      end
    end

    context 'failure' do
      let(:name) { "" }

      it 'empty field returns 500' do
        patch :update, params: player_params

        expect(response).to have_http_status(:error)
      end
    end
  end

  describe '#delete' do
    let!(:player) { create(:player, :champion) }
    let(:params) do
      {
        id: player.id,
      }
    end

    context 'success' do
      it 'returns 200' do
        delete :destroy, params: params

        expect(response).to have_http_status(:ok)
      end
    end

    context 'failure' do
      it 'undestroyed record returns 500' do
        allow_any_instance_of(Player).to receive(:destroy!) { false }

        delete :destroy, params: params

        expect(response).to have_http_status(:error)
      end
    end
  end
end
