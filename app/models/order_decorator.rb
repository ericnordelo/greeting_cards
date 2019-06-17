Spree::Order.class_eval do
    checkout_flow do
        go_to_state :select_destinatary
        go_to_state :payment, if: ->(order) {
          order.update_totals
          order.payment_required?
        }
        go_to_state :complete
    end
    # remove_checkout_step :address
    # remove_checkout_step :delivery
    # insert_checkout_step :select_destinatary, before: :payment

    Spree::Order.state_machine.after_transition to: :complete, do: :send_email

    def payment_required?
        self.user.free_cards == 0
    end

    private

    def send_email
        current = 
        if current > 0
            self.user.update_attribute :free_cards, current-1
        end
        ProductsMailer.send_product(self.destinatary_email, self.products).deliver
    end

end