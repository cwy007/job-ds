class AddJobAddressToJobs < ActiveRecord::Migration[5.0]
  def change
    add_column :jobs, :job_address, :string 
  end
end
