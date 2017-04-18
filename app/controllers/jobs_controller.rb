class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]

  def index
    @jobs = case params[:order]
            when 'by_lower_bound'
              Job.publish.order('wage_lower_bound DESC')
            when 'by_upper_bound'
              Job.publish.order('wage_upper_bound DESC')
            else
              Job.publish.recent
            end
  end

  def show
    @job = Job.find(params[:id])
    @resumes = @job.resumes


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
      redirect_to jobs_path, notice: "Job was created successfully!"
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.save(job_params)
      redirect_to jobs_path, notice: "Job was updated successfully!"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path, alert: "Job was deleted!"
  end

  private

  def job_params
    params.require(:job).permit(:title, :description, :is_hidden, :wage_lower_bound, :wage_upper_bound, :contact_email)
  end

end
