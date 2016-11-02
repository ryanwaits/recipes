class CreateFormulas < ActiveRecord::Migration[5.0]
  def change
    create_table :formulas do |t|
      t.string :title
      t.text :description
      t.references :user, foreign_key: true

      t.timestamps
    end
  end
end
