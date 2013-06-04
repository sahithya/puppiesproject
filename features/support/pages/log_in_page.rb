class LogInPage
  include PageObject

  text_field(:username, :id => 'name')
  text_field(:password, :id => 'password')
  button(:log_in_button, :value => 'Login')

  def log_in(username="admin", password="password")
    self.username = username
    self.password = password
    log_in_button
  end


end