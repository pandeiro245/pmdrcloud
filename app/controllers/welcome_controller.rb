class WelcomeController < ApplicationController
  def index
    @workload  = Workload.new
    @workloads = Workload.limit(10).order(
      'started_at desc'
    )
    @client_id = '2b9312964a1619d99082a76ad2d6d8c6'
    path = 'ceciliato/25minutes-of-beastie-boys'
    @id = Track.new(@client_id).path_to_id(path)
    @auto_play = false
  end
end

