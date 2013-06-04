require_relative 'page_navigation_panel'

class LandingPage
  include PageObject
  include PageNavigationPanel

  page_url 'http://localhost:3000/login'


  def view_orders
    orders_link
  end

end