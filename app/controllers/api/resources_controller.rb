class Api::ResourcesController < Api::BaseController
  def index
    render json: { message: "Protected resource", user: current_user.email }
  end

  def show
    render json: { id: params[:id], user: current_user.email }
  end

  def create
    render json: { message: "Resource created", data: params }, status: :created
  end

  def update
    render json: { message: "Resource updated", id: params[:id] }
  end

  def destroy
    render json: { message: "Resource deleted", id: params[:id] }
  end
end
