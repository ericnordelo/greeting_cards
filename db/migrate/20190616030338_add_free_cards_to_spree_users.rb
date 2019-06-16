class AddFreeCardsToSpreeUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :spree_users, :free_cards, :integer, default: 0
  end
end
