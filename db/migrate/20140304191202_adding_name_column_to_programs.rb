class AddingNameColumnToPrograms < ActiveRecord::Migration
  def change
    add_column :programs, :name, :string
  end
end
