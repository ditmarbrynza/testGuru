class ApplicationController < ActionController::Base
  def after_sign_in_path_for(resource)
    if resource.is_a?(Admin)
      return "/admin/tests"
    else 
      return "/"
    end
  end
end
