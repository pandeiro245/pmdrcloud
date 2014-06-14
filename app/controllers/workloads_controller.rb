class WorkloadsController < ApplicationController
  def create
    @workload = Workload.new(workload_params)
    @workload.started_at = Time.now
    music = Music.order("RAND()").first
    @workload.music_id = music.id
    @workload.save
    redirect_to music_path(music)
  end

  def workload_params
    params.require(
      :workload
    ).permit(
      :title,
      :memo
    )
  end
end

