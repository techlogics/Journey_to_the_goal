class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  skip_before_filter :verify_authenticicity_token # csrf対策の無効化
  before_filter :authenticate_user!

  def after_sign_out_path_for resource
    root_path
  end

end
