class LinksController < ApplicationController
  def index
    if !current_user
      redirect_to authentication_path
    end
  end
end
