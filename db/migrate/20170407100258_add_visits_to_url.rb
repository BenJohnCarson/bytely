class AddVisitsToUrl < ActiveRecord::Migration[5.0]
  def change
    add_column :urls, :visits, :integer
  end
end
