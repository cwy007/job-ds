class CategoriesController < ApplicationController

def show
  @category = Category.find(params[:id])
  @jobs = @category.jobs.paginate(:page => params[:page], :per_page => 20)
end
end
