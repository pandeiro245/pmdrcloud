class MusicsController < ApplicationController
  def show
    @workload  = Workload.new
    @workloads = Workload.limit(10).order(
      'started_at desc'
    )
    @client_id = '2b9312964a1619d99082a76ad2d6d8c6'
    @music = Music.find(params[:id])
    @auto_play = false
  end
end

