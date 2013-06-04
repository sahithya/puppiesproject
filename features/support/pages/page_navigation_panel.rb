module PageNavigationPanel

  include PageObject

  link(:adopt_a_puppy_link, :text => 'Adopt a Puppy')
  link(:learn_link, :text => 'Learn')
  link(:animal_shelters_link, :text => 'Animal Shelters')
  link(:classifieds_link, :text => 'Classifieds')
  link(:message_boards_link, :text => 'Message Boards')
  link(:pet_news_link, :text => 'Pet News')
  link(:edit_puppies_list_link, :text => 'Puppies')
  link(:orders_link, :text => 'Adoptions')
  link(:logout_link, :text => 'LogOut')

end