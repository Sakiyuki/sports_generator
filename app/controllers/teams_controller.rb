class TeamsController < ApplicationController
  def index
    @teams = Team.all
  end

  def show
    @team = Team.find(params[:id])
  end

  def new
    @team = Team.new
  end

  def edit
    @team = Team.find(params[:id])
  end

  def create
    @team = Team.new
    @team.name = params[:team][:name]
    @team.description = params[:team][:description]

    if @team.save
      flash[:notice] = "Team successfully saved."
      redirect_to "/teams"
    else
      flash[:error] ="Team could not be saved."
      render :new
    end
  end

  def update
    @team = Team.find(params[:id])
    @team.name = params[:team][:name]
    @team.description = params[:team][:description]

    if @team.save
      flash[:notice] = "Team successfully updated"
      redirect_to @team
    else
      flash[:error] = "Team could not be saved"
      render :edit
    end
  end

    def destroy
      @team = Team.find(params[:id])

      if @team.destroy
        flash[:notice] = "\"#{@team.name}\" was deleted successufully."
        redirect_to action: :index
      else
        flash.now[:alert] = "There was an error deleting the team."
        render :show
      end
    end
  end
