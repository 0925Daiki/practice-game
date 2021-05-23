class CreateGames < ActiveRecord::Migration[6.0]
  def change
    create_table :games do |t|
      t.integer    :recruit_id,      null: false
      t.integer    :place_id,        null: false
      t.integer    :battle_level_id, null: false
      t.string     :comment,         null: false
      t.references :user,            null: false, foreign_key: true

      t.timestamps
    end
  end
end
