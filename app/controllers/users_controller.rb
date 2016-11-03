class UsersController < ApplicationController
  def home
  end

  def create
  end

  def failure
    render :text => "Sorry, but you didn't allow access to our app!"
  end
end
