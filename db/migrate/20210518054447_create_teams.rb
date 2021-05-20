class CreateTeams < ActiveRecord::Migration[6.0]
  def change
    create_table :teams do |t|
      t.integer    :area_id,       null: false
      t.integer    :member_id,    null: false
      t.integer    :team_level_id, null: false
      t.text       :profile
      t.references :user,          null: false, foreign_key: true

      t.timestamps
    end
  end
end
