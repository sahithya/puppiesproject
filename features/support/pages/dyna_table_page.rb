class DynaTablePage
  include PageObject

  page_url 'http://gwt.googleusercontent.com/samples/DynaTable/DynaTable.html'

  buttons(:none, :value => 'None')
  table(:schedule, :class => 'table')
  checkbox(:monday, :id => 'gwt-uid-2')
  checkbox(:tuesday, :id => 'gwt-uid-3')


  def select_schedule_for(day)
    clear_schedule
    self.send "check_#{day.downcase}"
  end

  def class_schedule_for(professor)
    
    wait_until(2, "schedule not updated") do
      row = schedule_element[professor]
    end

    row['Schedule'].text
  end

  private

  def clear_schedule
    :none
  end
end