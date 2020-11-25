class Api::UsersController < Api::BaseController
  before_action :find_user, only: [:show]
  before_action :check_profile_owner, only: [:show]

  def show
    render_resource(@user)
  end

  private

  def find_user
    @user = User.find(params[:id])
  end

  def check_profile_owner
    if @user.id != current_user.id 
      render json: { error: 'You aren\'t authorized !' }
    end
  end

end