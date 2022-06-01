class UsersController < ApplicationController

before_action :show, only: %i[ profile ]

private

  def show
    if current_user
      render user_path
    else
      redirect_back(fallback_location: root_path)
    end
  end
end