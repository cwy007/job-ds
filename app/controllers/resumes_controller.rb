class ResumesController < ApplicationController
  before_action :authenticate_user!

  def new
    @job = Job.find(params[:job_id])
    @resume = Resume.new
  end

  def edit
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
  end

  def create
    @job = Job.find(params[:job_id])
    @resume = Resume.new(resume_params)
    @resume.job = @job
    @resume.user = current_user
    if @resume.save
      redirect_to job_path(@job), notice: "Resume was submitted successfully!"
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
    if @resume.save(resume_params)
      redirect_to job_path(@job), notice: "Resume was updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:job_id])
    @resume = Resume.find(params[:id])
    @resume.destroy
    redirect_to job_path(@job), alert: "Resume was deletd!"
  end

  private

  def resume_params
    params.require(:resume).permit(:content, :attachment)
  end


end
