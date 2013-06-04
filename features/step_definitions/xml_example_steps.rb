Given(/^I have a contact list with following$/) do |table|
  # table is a | Cheezy | 234-5677  |
  builder = Builder::XmlMarkup.new
  @xml = builder.contacts do |contacts|
    table.hashes.each do |person|
      contacts.contact do |contact|
        contact.name person['name']
        contact.phone person['phone']
      end
    end
  end
end
When(/^I lookup the phone number of "([^"]*)"$/) do |name|
  @xml_doc = Nokogiri::XML(@xml)
  contacts = @xml_doc.xpath("//contact")
  @node = contacts.find { |row| row.to_s.include? name}
end
Then(/^I should get the phone number "([^"]*)"$/) do |phone_number|
  @node.at_xpath(".//phone").content.should == phone_number
end