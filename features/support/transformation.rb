Transform /^line item (\d+)$/ do |line_string|
line_string.to_i
end

#just an example to demonstrate matching on '7 days ago' in scenarios
Transform /^(\d+) (?:days|day) ago$/ do |days|
  days.to_i.days_ago
end