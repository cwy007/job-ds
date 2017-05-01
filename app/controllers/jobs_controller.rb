class JobsController < ApplicationController
  before_action :authenticate_user!, only: [:new, :create, :edit, :update, :destroy]
  before_action :require_is_admin, only: [:new, :create, :edit, :update, :destroy]
  before_action :validates_search_key, only: [:search]

  def index
    @jobs = case params[:order]
            when 'by_lower_bound'
              Job.publish.order('wage_lower_bound DESC').paginate(:page => params[:page], :per_page => 10)
            when 'by_upper_bound'
              Job.publish.order('wage_upper_bound DESC').paginate(:page => params[:page], :per_page => 10)
            else
              Job.publish.recent.paginate(:page => params[:page], :per_page => 10)
            end
    @categories = Category.all
  end

  def show
    @job = Job.find(params[:id])
    @resumes = @job.resumes.order('created_at DESC')
    if @job.is_hidden
      flash[:warning] = "这份职位已完成招聘!"
      redirect_to jobs_path
    end
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
      redirect_to jobs_path, notice: "创建成功!"
    else
      render :new
    end
  end

  def update
    @job = Job.find(params[:id])
    if @job.save(job_params)
      redirect_to jobs_path, notice: "修改成功!"
    else
      render :edit
    end
  end

  def destroy
    @job = Job.find(params[:id])
    @job.destroy
    redirect_to jobs_path, alert: "工作已删除!"
  end

  def search
  	@jobs = Job.ransack( :title_or_job_address_or_company_name_cont => @q ).result(distinct: true).publish.recent.paginate(:page => params[:page], :per_page => 5)
    if @jobs.blank?
      flash[:warning] = "查询不存在！"
      redirect_to jobs_path
    end
  end

  private

  def validates_search_key
  	@q = params[:q].gsub(/\\|\'|\/|\?/, "") if params[:q].present?
  end

  def job_params
    params.require(:job).permit(:title, :description, :is_hidden, :wage_lower_bound, :wage_upper_bound, :contact_email)
  end

end
