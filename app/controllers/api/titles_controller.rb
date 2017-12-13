module Api
  class TitlesController < ApplicationController

    def index
      render json: { titles: titles}, status: 200
    end

    private

    def titles
      Title.where(player_id: player_id)
    end

    def player_id
      params.require(:player_id)
    end
  end
end
