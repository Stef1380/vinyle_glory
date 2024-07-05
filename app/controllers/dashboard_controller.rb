class DashboardController < ApplicationController
  # before_action :set_genre, only: [:new, :create]
  # before_action :set_author, only: [:new, :create]
  before_action :authenticate_user!

  def show
    @vinyls = Vinyl.where(user: current_user).all
    @vinyl = Vinyl.new
  end

  def new
    @vinyl = Vinyl.new
  end

  def create
    @vinyl = Vinyl.new(vinyl_params)
    @vinyl.user = current_user # Associer le vinyl à l'utilisateur actuel
    if @vinyl.save
      redirect_to dashboard_path, notice: "Vinyl successfully created."
    else
      render :new, status: :unprocessable_entity
    end
  end

  def edit
  end

  def update
    @vinyl = Vinyl.find(params[:id])
    if @vinyl.update(vinyl_params)
      redirect_to vinyl_path(@vinyl)
    else
      render "edit", status: :unprocessable_entity
    end
  end

  def destroy
    @vinyl = Vinyl.find(params[:id])
    @vinyl.destroy
    redirect_to dashboard_path, notice: "Vinyl successfully destroyed."
  end


  private

  def vinyl_params
    params.require(:vinyl).permit(:name, :price, :year, :condition, :time, :genre_id, :artist_id)
  end

end
