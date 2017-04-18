class ResumesController < ApplicationController
  before_action :authenticate_user!

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.job = @job
    @resume.user = current_user
    if @resume.save
      redirect_to jobs_path, notice: "Resume was submitted successfully!"
    else
      render :new
    end
  end

  private

  def resume_params
    params.require(:resume).permit(:content)
  end


end