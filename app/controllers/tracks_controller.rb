class TracksController < ApplicationController
  def index
    id = URI.encode(params[:q])
    redirect_to "/tracks/#{id}"
  end

  def show
    @client_id = '2b9312964a1619d99082a76ad2d6d8c6'
    @tracks = Track.search params[:id]
  end
end

