class CreateMovieCastMembers < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_cast_members do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :cast_member, null: false, foreign_key: true

      t.timestamps
    end
  end
end
