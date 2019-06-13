class AddDestinataryEmailToSpreeOrder < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_orders, :destinatary_email, :string
  end
end
