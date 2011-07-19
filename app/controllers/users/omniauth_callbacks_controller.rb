class Users::OmniauthCallbacksController < Devise::OmniauthCallbacksController

  def google_apps
    omniauth = env["omniauth.auth"]
    
    @user = User.find_for_google_apps_oauth(omniauth, current_user)
    
    if @user and @user.persisted?
      flash[:notice] = I18n.t "devise.omniauth_callbacks.success"
      sign_in_and_redirect @user, :event => :authentication
    else
      flash[:alert] = I18n.t "devise.omniauth_callbacks.failure"
      redirect_to root_url
    end
  end
  
  def passthru
    render :file => "#{Rails.root}/public/404.html", :status => 404, :layout => false
  end


end