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
    flash[:notice] = "收藏成功"
    redirect_back(fallback_location: root_path)
  end

  def unfavorite
    @resume = Resume.find(params[:id])
    @resume.favorite = false
    @resume.save
    flash[:alert] = "你已取消收藏！"
    redirect_back(fallback_location: root_path)
  end

end
