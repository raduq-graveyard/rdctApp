class CreateFilters < ActiveRecord::Migration
  def change
    create_table :filters do |t|
      t.string :name
      t.string :query
      t.string :value
      t.string :operation

      t.timestamps
    end
  end
end
