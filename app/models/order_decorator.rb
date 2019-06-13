Spree::Order.class_eval do
    remove_checkout_step :address
    remove_checkout_step :delivery
    insert_checkout_step :select_destinatary, before: :payment

end