class RenameNameToGenreNameInGenres < ActiveRecord::Migration[8.0]
  def change
    rename_column :genres, :name, :genre_name
  end

  
end
