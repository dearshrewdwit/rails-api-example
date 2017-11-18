module Api
  class PlayersController < ApplicationController
    rescue_from ActiveRecord::RecordNotFound, :with => :record_not_found

    def index
      players = Player.all

      render json: { players: players }
    end

    def show
      render json: { player: player }
    end

    def create
      new_player = Player.new(player_params)

      if new_player.save
        render json: { player: new_player }
      else
        render json: { errors: new_player.errors }, status: 500
      end
    end

    def update
      if player.update_attributes(player_params)
        render json: { player: player }
      else
        render json: { errors: player.errors }, status: 500
      end
    end

    def destroy
      if player.destroy!
        render json: { player: player }
      else
        render json: { errors: player.errors }, status: 500
      end
    end

    private

    def player_params
      params.require(:player).permit(:age, :grand_slams, :name, :prize_money, :titles)
    end

    def player
      @player ||= Player.find_by!(id: id)
    end

    def id
      params.require(:id)
    end

    def record_not_found
      render json: { errors: ["Couldn't find Player {id: #{id}}"] }, status: 500
    end
  end
end
