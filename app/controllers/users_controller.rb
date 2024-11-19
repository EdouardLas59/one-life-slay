class UsersController < ApplicationController
    before_action :set_user, only: [:show_booking]



    def set_user
      @user = User.find(params[:id])
    end
  end
