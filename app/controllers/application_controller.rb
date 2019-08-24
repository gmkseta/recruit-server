class ApplicationController < ActionController::Base
  before_action :configure_permitted_parameters, if: :devise_controller?
  before_action :load_sidebar_hash

  #추가
  def configure_permitted_parameters
    added_attrs = %i{name image phone}
    devise_parameter_sanitizer.permit :sign_up, keys: added_attrs
    devise_parameter_sanitizer.permit :account_update, keys: added_attrs
  end
  
  private
  def load_sidebar_hash
    @teams_hash = {
      '팀 목록': teams_path,
      '팀 생성': new_team_path
    }
  end
end
