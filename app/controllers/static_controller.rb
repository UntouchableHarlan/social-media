class StaticController < ApplicationController
  def home
    @microposts = Micropost.all
  end
end
