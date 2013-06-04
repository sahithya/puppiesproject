
require 'rspec-expectations'
require 'page-object'
require 'data_magic'
require 'require_all'
require 'fig_newton'
require 'nokogiri'
require 'builder'

require_rel 'pages' #the pages directory

World(PageObject::PageFactory)

#require_all gem - how cucumber loads things  env.rb file
PageObject::PageFactory.routes = {
    :default => [[HomePage, :select_puppy],
                 [DetailsPage, :add_to_cart],
                 [ShoppingCartPage, :proceed_to_checkout],
                 [CheckoutPage, :checkout]],

    :orders_page_route => [[LandingPage, :log_in],
             [LogInPage, :user_login],
             [OrdersPage, :process_order]
             ]

}

