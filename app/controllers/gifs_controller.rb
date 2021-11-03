class GifsController < ApplicationController
  before_action :authenticate_user!, :except => [:index, :show]

  def index
    @list = Gif.order(:created_at, :desc).limit(5)
  end

  def show
    @model = Gif.find(params[:id])
  end

  def new
    @model = Gif.new
  end

  def create
    gif = Gif.create!(:user => current_user,**_params)
    redirect_to gif
  end

  private

  def _params
    params.require(:gif).permit(
      :file
    )
  end

end