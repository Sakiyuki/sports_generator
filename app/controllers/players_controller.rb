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
    
  end


  def create
    @player = Player.new
    @player.name = params[:player][:name]
    @player.number = params[:player][:number]

    if @player.save
      flash[:notice] = "Player successfully saved."
      redirect_to "/players"
    else

    end

  end

end
