class BillingMailer < ApplicationMailer
  def send_mail_billing hiring, user
    mail(to: user.email, subject: t(".send_bill")) do |format|
      format.html{render locals: billing_locals(hiring, user)}
    end
  end

  private

  def billing_locals hiring, user
    {
      hiring_time: hiring.time,
      user_name: user.name,
      hiring_id: hiring.id,
      vehicle_name: hiring.vehicle_name,
      total: hiring.time * hiring.vehicle_price,
      branch_name: hiring.branch_name,
      created_at: hiring.created_at.to_date
    }
  end
end
