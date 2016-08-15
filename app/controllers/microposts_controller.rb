class MicropostsController < ApplicationController
  before_action :require_user

  def new
    @micropost = current_user.microposts.new
  end

  def create
    @micropost = current_user.microposts.build(micropost_params)
    if @micropost.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  def edit
    @micropost = current_user.microposts.find_by(params[:id])
  end

  def update
    @micropost = current_user.microposts.find_by(params[:id])
    if @micropost.update
      redirect_to current_user
    else
      render 'new'
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
