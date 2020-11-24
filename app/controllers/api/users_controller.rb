class Api::UsersController < Api::BaseController
  before_action :find_user, only: %w[show]
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
      render json: 'You aren\'t authorized !'
    end
  end

end