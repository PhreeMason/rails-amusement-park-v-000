class AttractionsController < ApplicationController
  before_action :admin_check, only: [:new, :create]
  
  def show
    if current_user
      @attraction = Attraction.find_by(id: params[:id]) 
    else
      redirect_to '/'
    end
  end

  def index
    if current_user
      @attractions = Attraction.all 
    else
      redirect_to '/'
    end
  end
  
  def new
    @attraction = Attraction.new
  end
  
  def create
    @attraction = Attraction.new(attractions_params)
    if @attraction.save
      redirect_to @attraction
    else
      render :new
    end
  end
  
  private 
    def attractions_params
      params.require(:attraction).permit(:name, :tickets, :nausea_rating, :happiness_rating, :min_height)
    end
    
    def admin_check
      redirect_to '/' if !current_user.admin?
    end
end
