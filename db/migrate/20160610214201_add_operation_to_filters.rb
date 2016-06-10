class AddOperationToFilters < ActiveRecord::Migration
  def change
    add_column :filters, :operation, :string
  end
end
