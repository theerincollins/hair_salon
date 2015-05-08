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

describe('update client path', {:type => :feature}) do
  it('will update details about a client, update in database then display the updates on owner page') do
    test_client = Client.new({:name => "Sassy Guy", :id => nil, :type_of_cut => "Buzz Cut", :stylist_id => 2})
    test_client.save()
    test_client.update({:name => "Crazy Pete", :type_of_cut => "Long Cut", :id => nil, :stylist_id => 3})
    visit("/owner")
    expect(page).to have_content(test_client.name())
  end
end
