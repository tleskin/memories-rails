class MemoriesController < ApplicationController
  respond_to :json
  skip_before_filter  :verify_authenticity_token

  def index
    @memories = Moment.get_past_moments

    render json: @memories
  end
end
