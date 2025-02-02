require "test_helper"

class ApplicationSystemTestCase < ActionDispatch::SystemTestCase
  # driven_by :selenium, using: :chrome, screen_size: [1400, 1400] For use in Linux
  # For use in Windows
  Capybara.server_host = "127.0.0.1"
  Capybara.server_port = 3001
  Capybara.app_host = "http://127.0.0.1:3001"

  driven_by :selenium, using: :headless_chrome, screen_size: [ 1400, 1400 ] do |options|
    options.add_argument("--no-sandbox")
    options.add_argument("--disable-dev-shm-usage")
    options.add_argument("--headless")
  end
end