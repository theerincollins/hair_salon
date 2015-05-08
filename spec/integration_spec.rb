require('capybara/rspec')
require('./app')
require('spec_helper')
Capybara.app = Sinatra::Application
set(:show_exceptions, false)

describe('owner portal path', {:type => :feature}) do
  it('will take user to the owner portal') do
    visit('/')
    click_link('BoBo Nay-Nay')
    expect(page).to have_content('Welcome to the Owner Portal')
  end
end
