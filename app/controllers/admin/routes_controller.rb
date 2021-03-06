class Admin::RoutesController < Admin::BaseController
  before_action :set_route, only: [:show, :edit, :update, :destroy]

  def index
  	@routes = Route.all
  end

  def show
  end

  def new
  	@route = Route.new
  end

  def create
  	@route = Route.new(train_params)

  	if @route.save
  	  redirect_to @route
  	else
  	  render :new
  	end
  end

  def edit
  end

  def update
  	if @route.update(train_params)
  	  redirect_to @route
  	else
  	  render :edit
  	end
  end

  def destroy
  	@route.destroy
  	redirect_to routes_path
  end

  private

  def set_route
  	@route = Route.find(params[:id])
  end

  def train_params
  	params.require(:route).permit(:name)
  end
end