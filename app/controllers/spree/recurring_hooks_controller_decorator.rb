Spree::RecurringHooksController.class_eval do
    def handler
        @subscription_event = @subscription.events.build(subscription_event_params)
        if @subscription_event.save
            if subscription_event_params[:request_type] == "invoice.payment_succeeded" or subscription_event_params[:request_type] == "charge.succeeded" 
                @subscription.user.update_attribute(:free_cards, @subscription.user.subscription_plans.active.first.free_cards)
            end
            render_status_ok and return
        else
            render_status_failure and return
        end
    end
end