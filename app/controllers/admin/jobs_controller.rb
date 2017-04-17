class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_is_admin
  
  def index
    @jobs = Job.all.recent
  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
  end

  def edit
    @job = Job.find(params[:id])
  end

  def create
    @job = Job.new(job_params)
    if @job.save
      redirect_to admin_jobs_path, notice: "Job was created successfully!"
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.save(job_params)
      redirect_to admin_jobs_path, notice: "Job was updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path, alert: "Job was deleted!"
  end

  private

  def require_is_admin
    if current_user.email != "chanweiyan007@gmail.com"
      flash[:warning] = "You have no permission!"
      redirect_to root_path
    end
  end

  def job_params
    params.require(:job).permit(:title, :description)
  end

end
