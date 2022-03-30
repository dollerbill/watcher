class AddImagePathToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :image_path, :string
  end
end
