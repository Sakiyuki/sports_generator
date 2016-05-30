class PlayersController < ApplicationController
  def index
    @players = Player.all
  end

  def show
    @player = Player.find(params[:id])
  end

  def new
    @player = Player.new
  end

  def edit
    @player = Player.find(params[:id])
  end

  def update
    @player = Player.find(params[:id])
    @player.name = params[:player][:name]
    @player.number = params[:player][:number]
    @player.team_id = params[:player][:team_id]

    if @player.save
      flash[:notice] = "Player successfully updated"
      redirect_to @player
    else
      flash[:error] = "Player could not be saved"
      render :edit
    end
  end


  def create
    @player = Player.new
    @player.name = params[:player][:name]
    @player.number = params[:player][:number]
    @player.team_id = params[:player][:team_id]

    if @player.save
      flash[:notice] = "Player successfully saved."
      redirect_to "/players"
    else
      flash[:notice] = "Player could not be saved successgully"
      render :new
    end
  end

    def destroy
    @player = Player.find(params[:id])

    if @player.destroy
      flash[:notice] = "\"#{@player.name}\" was deleted successufully."
      redirect_to action: :index
    else
      flash.now[:alert] = "There was an error deleting the player."
      render :show
    end
  end
end
