Spree::Order.class_eval do
    remove_checkout_step :address
    remove_checkout_step :delivery
    insert_checkout_step :select_destinatary, before: :payment

    Spree::Order.state_machine.after_transition to: :complete, do: :send_email

    private

    def send_email
        ProductsMailer.send_product(self.destinatary_email, self.products).deliver
    end
end