class ReciversController < ApplicationController
  def index
    @reciver=current_user.following.order(:name).where("name like ?", "%#{params[:term]}%")
    render json: @reciver.map(&:name)
  end
end
