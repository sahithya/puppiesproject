RSpec::Matchers.define :have_error_message do |message|
  match do |page|
    page.errors.include? message
  end

  failure_message_for_should_not do |page|
    "Expected #{page.errors} to  not include '#{message}'"

  end


  failure_message_for_should do |page|
    "Expected #{page.errors} to include #{message}"
  end
end