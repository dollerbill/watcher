class RemoveUser1ReactionFromMovies < ActiveRecord::Migration[6.1]
  def change
    remove_column :movies, :user_1_reaction
    remove_column :movies, :user_2_reaction
  end
end
