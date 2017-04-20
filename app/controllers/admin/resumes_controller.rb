class Admin::ResumesController < ApplicationController
  before_action :authenticate_user!
  before_action :require_is_admin
  layout 'admin'

  def index
    @job = Job.find(params[:job_id])
    @resumes = @job.resumes
  end

  def favos
    @resumes = Resume.where(:favorite => true)
  end

  def favorite
    @resume = Resume.find(params[:id])
    @resume.favorite = true
    @resume.save
    redirect_to :back
  end

  def unfavorite
    @resume = Resume.find(params[:id])
    @resume.favorite = false
    @resume.save
    redirect_to :back
  end

end
