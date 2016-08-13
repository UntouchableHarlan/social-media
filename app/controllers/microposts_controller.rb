class MicropostsController < ApplicationController
  before_action :require_user

  def new
    @micropost = Micropost.new
  end

  def create
    @micropost = current_user.micropost.build(micropost_params)
    if @micropost.save
      redirect_to root_path
    else
      render 'new'
    end
  end

  private

  def micropost_params
    params.require(:micropost).permit(:content)
  end
end
