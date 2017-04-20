class AddFavoriteToResumes < ActiveRecord::Migration[5.0]
  def change
    add_column :resumes, :favorite, :boolean, default: false
  end
end
