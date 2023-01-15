class InitSchema < ActiveRecord::Migration[6.1]
  def change
    create_table "books" do |t|
      t.string "title"
      t.text "memo"
      t.datetime "created_at", precision: 6, null: false
      t.datetime "updated_at", precision: 6, null: false
    end
  end
end
