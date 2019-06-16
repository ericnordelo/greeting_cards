Spree::Admin::PlansController.class_eval do
  private

  def plan_params(action=:create)
    if action == :create
      params.require(:plan).permit(:name, :free_cards, :trial_period_days, :interval, :currency, :amount, :active, :interval_count, :default)
    else
      params.require(:plan).permit(:name, :free_cards, :active, :default)
    end
  end
end