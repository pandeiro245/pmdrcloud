class WorkloadsController < ApplicationController
  def create
    @workload = Workload.new(workload_params)
    @workload.started_at = Time.now
    @workload.save
    redirect_to root_path
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

