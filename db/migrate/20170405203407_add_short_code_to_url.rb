class AddShortCodeToUrl < ActiveRecord::Migration[5.0]
  def change
    add_column :urls, :short_code, :string
  end
end
