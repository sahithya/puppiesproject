class HomePage
  include PageObject
  include PageNavigationPanel

  page_url 'http://localhost:3000/' #visit the page e.g. visit HomePage

  divs(:name, :class => 'name')
  buttons(:view_detail, :value => 'View Details')

  #not generating methods off of this so use _element with the GUI resource
  def select_puppy(name = 'Hanna')
    index = index_for(name)
    view_detail_elements[index].click
  end

  def index_for(name)
    name_elements.find_index{|puppy_name| puppy_name.text == name}
  end


end