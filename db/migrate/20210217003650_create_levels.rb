class CreateLevels < ActiveRecord::Migration[6.1]
  def change
    create_table :levels do |t|
      t.string :name
      t.references :vacancy, null: false, foreign_key: true

      t.timestamps
    end
  end
end
