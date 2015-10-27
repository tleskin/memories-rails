class MomentsController < ApplicationController
  respond_to :json
  skip_before_filter  :verify_authenticity_token

  def index
    @moments = Moment.all

    render json: @moments
  end

  def create
    moment = Moment.new({content: params[:moment][:content],
                         caption: params[:moment][:caption],
                         happened_at: params[:moment][:happened_at],
                         location: params[:moment][:location]})

    if moment.save
      @message = {message: "Added moment!"}
    else
      @message = {message: "Moment not added!"}
    end

    respond_with moment.id, status: 201, location: nil
  end
end
