class Admin::JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_is_admin
  layout "admin"
  def index
    @jobs = Job.all.recent.paginate(:page => params[:page], :per_page => 15)

  end

  def show
    @job = Job.find(params[:id])
  end

  def new
    @job = Job.new
    @categories = Category.all.map { |c| [c.name, c.id] } #这一行为加入的代码
  end

  def edit
    @job = Job.find(params[:id])
    @categories = Category.all.map { |c| [c.name, c.id] } #这一行为加入的代码
  end

  def create
    @job = Job.new(job_params)
    @job.user = current_user
    @job.category_id = params[:category_id]
    if @job.save
      redirect_to admin_jobs_path, notice: "新建成功！"
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.update(job_params)
      redirect_to admin_jobs_path, notice: "修改成功!"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to admin_jobs_path, alert: "职位已删除!"
  end

  def hide
    @job = Job.find(params[:id])
    @job.hide!
    redirect_to admin_jobs_path
  end

  def publish
    @job = Job.find(params[:id])
    @job.publish!
    redirect_to admin_jobs_path
  end


  private

  def job_params
    params.require(:job).permit(:title, :description, :is_hidden,
                  :wage_lower_bound, :wage_upper_bound, :contact_email,
                  :category_id, :job_address, :company_name, :company_image)
  end

end
