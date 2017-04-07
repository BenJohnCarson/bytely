class AddDateLastVisistToUrl < ActiveRecord::Migration[5.0]
  def change
    add_column :urls, :date_last_visit, :date
  end
end
