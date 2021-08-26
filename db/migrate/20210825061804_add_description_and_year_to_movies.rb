class AddDescriptionAndYearToMovies < ActiveRecord::Migration[6.1]
  def change
    add_column :movies, :description, :string
    add_column :movies, :release_year, :string
  end
end
