class AddValueToFilters < ActiveRecord::Migration
  def change
    add_column :filters, :value, :string
  end
end
