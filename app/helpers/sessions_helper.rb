# coding: utf-8
module SessionsHelper
  def sign_in(user)
    cookies.permanent.signed[:remember_token] = [user.id, user.salt]
    self.current_user = user
  end
  
  def current_user=(user)
    @current_user = user
  end
  
  def current_user
    @current_user ||= user_from_remember_token
  end
  
  def signed_in?
    !current_user.nil?
  end
  
  def admin?
    signed_in? && UserType.find(current_user.user_type_id).admin
  end

  def lymph?
    signed_in? && UserType.find(current_user.user_type_id).name == "лимфолог"
  end

  def phleb?
    signed_in? && UserType.find(current_user.user_type_id).name == "флеболог"
  end
  
  def not_editable(user)
    admin? && (current_user == user)
  end
  
  def sign_out
    cookies.delete(:remember_token)
    self.current_user = nil
  end
  
  def deny_access
    redirect_to login_path, :notice => "Please sign in to access this page."
  end
  
  def current_user?(user)
    user == current_user
  end
  
  private

    def user_from_remember_token
      User.authenticate_with_salt(*remember_token)
    end

    def remember_token
      cookies.signed[:remember_token] || [nil, nil]
    end
end
