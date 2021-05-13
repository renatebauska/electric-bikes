class CreateBikes < ActiveRecord::Migration[6.1]
  def change
    create_table :bikes do |t|
      t.string :name
      t.boolean :available, default: true

      t.timestamps
    end
  end
end
