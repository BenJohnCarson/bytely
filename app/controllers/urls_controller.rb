class UrlsController < ApplicationController
  
  def index
    render json: Url.all
  end
  
  def create
    url = Url.new(url_params)
    if url.save
      render json: url
    else
      head :ok, status: :bad_request
    end
  end
  
  private
  
  def url_params
    params.require(:url).permit(:original_url)
  end
end
