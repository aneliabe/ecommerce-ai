class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def demo_login
    user = User.find_by(email: "user1@example.com")
    user.questions.destroy_all
    sign_in(:user, user)
    redirect_to root_path, notice: "Welcome to the demo!"
  end
end
