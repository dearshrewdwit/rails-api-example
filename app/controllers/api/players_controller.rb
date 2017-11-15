module Api
  class PlayersController < ApplicationController
    def index
      players = Player.all

      return head :no_content if players.empty?

      render json: players
    end
  end
end
