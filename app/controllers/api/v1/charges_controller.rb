class Api::V1::ChargesController < ApplicationController


  def new
  end

  def create
    # Amount in cents
    # @amount = 500
    #
    customer = Stripe::Customer.create(
        :email => @current_user.email,
        :source  => params[:token][:id]
    )

    charge = Stripe::Charge.create(
        :customer    => customer.id,
        :amount      => params[:amount],
        :description => 'Package customer',
        :currency    => 'eur'
    )

    package = Package.find(params[:package_id])
    @current_user.packages << package
    render :json => params[:token]

  end


rescue Stripe::CardError => e
  render :json => { :errors => e.message }
end