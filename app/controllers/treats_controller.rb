class TreatsController < ApplicationController
  def index
    @treats = Treat.paginate page: params[:page], per_page: 30
  end
end
