class CreateEvents < ActiveRecord::Migration
  def change
    create_table :events do |t|
      t.references :user, index: true, foreign_key: true
      t.string :title
      t.time :start
      t.time :end
      t.text :description
      t.string :location

      t.timestamps null: false
    end
  end
end
