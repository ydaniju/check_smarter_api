# frozen_string_literal: true
class CreateChecklists < ActiveRecord::Migration[5.0]
  def change
    create_table :checklists do |t|
      t.string :title
      t.string :comments
      t.integer :votes, default: 0
      t.references :user, index: true, foreign_key: true

      t.timestamps
    end
  end
end
