class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def github
    @user = User.from_github(request.env["omniauth.auth"])
    puts "==="
    puts @user.inspect
    puts "==="

    if @user.persisted?
      sign_in_and_redirect @user, event: :authentication
    else
      session["devse.github"] = request.env["omniauth.auth"]
      redirect_to new_user_registration_url
    end
  end

end
