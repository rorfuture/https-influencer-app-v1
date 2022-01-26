class AuthController < ApplicationController
  def callback
    omniauth_response = request.env['omniauth.auth']
    if (omniauth_response)
      auth = Auth.omniauth(request.env['omniauth.auth'], current_user.try(:id))
      email = omniauth_response['info'].present? ? omniauth_response['info']['email'] : nil
      password = SecureRandom.hex(1) + '' + SecureRandom.hex(2).upcase + '' + SecureRandom.hex(3).upcase + '' + SecureRandom.hex(2)
      if (!current_user)
        user = User.find_by_email(email)
        if (!user)
          user = User.new(email: email, password: password)
          user.save
        end
      end
      auth.save
      sign_in user unless current_user
      redirect_to root_path
    else
      redirect_to root_path
    end  
  end
end
