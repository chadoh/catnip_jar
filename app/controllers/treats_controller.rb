class TreatsController < ApplicationController
  http_basic_authenticate_with name: ENV["USERNAME"],
    password: ENV["PASSWORD"],
    only: :index

  skip_before_filter :verify_authenticity_token, only: :create

  def index
    @treats = Treat.paginate page: params[:page], per_page: 30
  end

  def create
    @treat = Treat.find_or_create_by treat_params
    @treat.cookies = params[:treat][:cookies]

    respond_to do |format|
      if @treat.save
        format.json { render :show, status: :created, location: @treat }
      else
        format.json { render json: @treat.errors, status: :unprocessable_entity }
      end
    end
  end

  def destroy
    @treat = Treat.find(params[:id])

    @treat.destroy
    respond_to do |format|
      format.html { redirect_to root_url }
      format.json { head :no_content }
    end
  end


  private

  def treat_params
    params[:treat].permit(:site, :username)
  end
end
