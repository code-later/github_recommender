class ImportJobsController < ApplicationController
  before_filter :require_login, only: [:show]

  def show
    @job_id = params[:id]
  end

  def job_status
    if Sidekiq::Status.complete?(params[:id])
      status_message = { status: 'ready', url: recommendations_path }
    else
      status_message = { status: 'notready' }
    end

    render json: status_message
  end
end
