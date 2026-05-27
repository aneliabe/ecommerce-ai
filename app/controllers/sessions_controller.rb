class SessionsController < ApplicationController
  skip_before_action :authenticate_user!
  
  def demo_login
    user = User.find_by(email: "user1@example.com")
    sign_in(user)
    redirect_to root_path, notice: "Welcome to the demo!"
  end
end
