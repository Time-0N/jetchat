class Api::UsersController < Api::BaseController
  def me
    render json: {
      id: current_user.id,
      email: current_user.email,
      name: current_user.name,
      first_name: current_user.first_name,
      last_name: current_user.last_name
    }
  end
end
