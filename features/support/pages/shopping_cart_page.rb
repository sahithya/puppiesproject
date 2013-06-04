class ShoppingCartPage
  include PageObject

  ROWS_PER_PUPPY = 6
  NAME_COLUMN = 1
  SUBTOTAL_COLUMN = 3

  button(:continue_shopping, :value => 'Adopt Another Puppy')
  button(:proceed_to_checkout, :value => 'Complete the Adoption')
  table(:cart, :index=> 0)
  cell(:cart_total, :class => 'total_cell') #table element

  def name_for_line_item(line_item)
    info_for(line_item, NAME_COLUMN)
  end

  def subtotal_for_line_item(line_item)
    info_for(line_item,SUBTOTAL_COLUMN)
  end

  private


  def info_for(line_item, column)
    row = (line_item - 1) * ROWS_PER_PUPPY
    cart_element[row][column].text
  end

end