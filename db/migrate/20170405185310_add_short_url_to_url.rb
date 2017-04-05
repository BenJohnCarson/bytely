class AddShortUrlToUrl < ActiveRecord::Migration[5.0]
  def change
    add_column :urls, :short_url, :string
  end
end
