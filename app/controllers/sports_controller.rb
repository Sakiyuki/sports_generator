class SportsController < ApplicationController
  def index
    @sports = Sport.all
  end

  def show
    @sport = Sport.find(params[:id])

  end

  def new
    @sport = Sport.new
  end

  def edit
    @sport = Sport.find(params[:id])
  end

  def update
    @sport = Sport.find(params[:id])
    @sport.name = params[:sport][:name]
    @sport.description = params[:sport][:description]
  

    if @sport.save
      flash[:notice] = "Sport successfully updated"
      redirect_to @sport
    else
      flash[:error] = "Sport could not be saved"
      render :edit
    end
  end

  def create

    @sport = Sport.new
    @sport.name = params[:sport][:name]
    @sport.description = params[:sport][:description]

    if @sport.save
      flash[:notice] = "Sport successfully saved."
      redirect_to "/sports"
    else
      flash[:error] = "Sport could not be saved"
      render :new
    end

  end


end
