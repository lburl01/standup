class CreateBulbs < ActiveRecord::Migration[5.0]
  def change
    create_table :bulbs do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.text :bright
      t.text :dim
      t.text :blocked
      t.integer :likes, default: 0
      t.integer :panic_score, default: 0
      t.boolean :is_deleted, default: false

      t.timestamps
    end
  end
end
