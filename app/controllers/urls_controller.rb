class UrlsController < ApplicationController
  
  def index
    render json: Url.all
  end
  
  def create
    url = Url.new(url_params)
    if url.save
      url.create_short_url(request.base_url, url.id)
      url.create_short_code(url.id)
      url.save
      render json: url
    else
      head :ok, status: :bad_request
    end
  end
  
  def show
    if params[:short_code]
      url = Url.find_by(short_code: params[:short_code])
      url.add_visit
      url.save
      redirect_to url.original_url
    else
      render json: Url.find(params[:id])
    end
  end
  
  private
  
  def url_params
    params.require(:url).permit(:original_url)
  end
end
