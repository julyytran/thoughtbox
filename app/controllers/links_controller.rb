class LinksController < ApplicationController
  def index
    if !current_user
      redirect_to signup_path
    end
  end
end
