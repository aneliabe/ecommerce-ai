class AddQrCodeToProductt < ActiveRecord::Migration[7.1]
  def change
    add_column :products, :qr_code, :string
  end
end
