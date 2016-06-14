class RequestsController < ApplicationController

  def new
    @request = Request.new
  end

  def create
    request_params  = params.require(:request).permit(:name, :email, :department, :message, :status)
    @request        = Request.new request_params
    if @request.save
      redirect_to requests_path
    else
      render :new
    end
  end

  def show
    @request = Request.find params[:id]
  end

  def index
    @request = Request.order(id: :desc)
  end

  def edit
    @request = Request.find params[:id]
  end

  def update
    @request = Request.find params[:id]
    request_params  = params.require(:request).permit(:name, :email, :department, :message, :status)
    @request.update request_params
    redirect_to requests_path
  end

  def destroy
    @request = Request.find params[:id]
    @request.destroy
    redirect_to requests_path
  end

end
