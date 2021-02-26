class CreateCompanies < ActiveRecord::Migration[6.1]
  def change
    create_table "companies", force: :cascade do |t|
      t.string "name"
      t.string "address"
      t.string "cnpj"
      t.string "site"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
