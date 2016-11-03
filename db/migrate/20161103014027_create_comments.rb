class CreateComments < ActiveRecord::Migration[5.0]
  def change
    create_table :comments do |t|
      t.belongs_to :user, index: true, foreign_key: true
      t.text :comment
      t.belongs_to :bulb, index: true, foreign_key: true

      t.timestamps
    end
  end
end
