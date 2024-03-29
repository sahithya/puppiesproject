require_relative 'checkout_page_errors'


class CheckoutPage
  include PageObject
  include DataMagic
  include CheckoutPageErrors

  expected_title "Sally's Puppy Adoption Agency"
  expected_element :pay_type

  text_field(:name, :id => 'order_name')
  text_field(:address, :id => 'order_address')
  text_field(:email, :id => 'order_email')
  select_list(:pay_type, :id => 'order_pay_type')
  button(:place_order, :value => 'Place Order')

  def initialize_page
    has_expected_title?
    has_expected_element?
  end


  def checkout( data = {})
    populate_page_with data_for(:checkout_page, data)
    place_order
  end


end