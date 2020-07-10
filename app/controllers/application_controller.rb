class ApplicationController < ActionController::Base

  def authenticate_user!
    if ! user_signed_in?
      session['account_return_to'] = request.path
      redirect_to new_user_registration_path
    end
  end

  def after_sign_in_path_for(account)
    session['account_return_to'] || account_url(account)
  end
end
