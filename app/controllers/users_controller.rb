class UsersController < ApplicationController

before_action :set_user, only: %i[ show  ]

private

  def set_user
    if current_user
      render user_path
    else
      redirect_back(fallback_location: root_path)
    end
  end
end