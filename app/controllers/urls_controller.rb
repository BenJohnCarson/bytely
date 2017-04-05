class UrlsController < ApplicationController
  
  def index
    render json: Url.all
  end
  
end
