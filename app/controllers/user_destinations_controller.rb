class UserDestinationsController < ApplicationController

  def destroy
    @user_destination = UserDestination.find(params[:id])
    @user_destination.destroy
    redirect_to destination_path(@user_destination.destination)
  end

  def create
    @destination = Destination.find(params[:id])
    @user = User.find_by(username: session[:user])
    @user_destination = UserDestination.find_or_create_by(user: @user, destination: @destination)
    redirect_to destination_path(@destination)
  end
end
