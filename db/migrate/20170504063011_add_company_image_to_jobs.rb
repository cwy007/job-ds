class AddCompanyImageToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :company_image, :string
  end
end
