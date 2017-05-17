require 'capybara/dsl'
require 'rack/test'

require './app/controllers/self_destruction_controller.rb'

describe 'Message creation' do
  include Rack::Test::Methods
  include Capybara::DSL

  Capybara.app = SelfDestructionController

  scenario 'Main page' do
    visit "/"

    expect(page).to have_content('Self-destruction')
    expect(page).to have_link('Create new message')
  end

  context "Message that will not be destroyed about one hour" do

    before do
      visit "/new"
      fill_in "message[text]",  with: "message"
      check('message[destroy_one_hour]')
      visit "/"
    end

    scenario 'back to previous page' do
      first('.show_link').click

      expect(page).to have_content('The message was created at:')      
      expect(page).to have_content('The message exist during:')      

      click_on 'Back'

      expect(page).to have_link('Create new message')
      expect(current_path).to eq("/")
    end
  end

# If you want to test show page with message that will be destroyed about one
# hour at first comment fifth line in app/models/message.rb
# after_commit :destroy_mes_in_one_hour, on: :create, if: :destroy_one_hour?

  # context "Message that will be destroyed about one hour" do

  #   before do
  #     visit "/new"
  #     fill_in "message[text]",  with: "message"
  #     check('message[destroy_one_hour]')

  #     click_on 'Submit'
  #   end

  #   scenario 'back to previous page' do
  #     first('.show_link').click

  #     expect(page).to have_content('The message was created at:')      
  #     expect(page).to have_content('The message will be destroyed at:')      
  #     expect(page).to have_content('1 person read this message(including you)')

  #     click_on 'Back'

  #     expect(page).to have_link('Create new message')
  #     expect(current_path).to eq("/")
  #   end
  # end
end
