class CreateShelves < ActiveRecord::Migration[7.0]
  def change
    create_table :shelves do |t|
      t.string :name, null: false, index: { unique: true, name: 'unique_shelve' }
      t.timestamps
    end
  end
end
