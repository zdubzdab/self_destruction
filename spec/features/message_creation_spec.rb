require 'capybara/dsl'
require 'rack/test'

require './app/controllers/self_destruction_controller.rb'

describe 'Message creation' do
  include Rack::Test::Methods
  include Capybara::DSL

  Capybara.app = SelfDestructionController

  context "Message creation" do

    before {visit "/"}

    scenario 'back to previous page' do
      click_on 'Create new message'

      expect(current_path).to eq("/new")
      expect(page).to have_content('Create message')
      expect(page).to have_content("If you don't choose 'Destroy this message " +
        "about one hour' this message will be destroyed if somebody visits link " +
        "that leads to it")

      click_on 'Back'

      expect(page).to have_link('Create new message')
      expect(current_path).to eq("/")
    end

    scenario 'try to create invalid message' do
      click_on 'Create new message'

      fill_in "message[text]",  with: ""

      click_on 'Submit'

      expect(page).to have_content("Text of message can't be blank")
      expect{Message}.not_to change(Message, :count)
    end

    scenario 'successful' do
      click_on 'Create new message'

      fill_in "message[text]",  with: "message"

      click_on 'Submit'

      expect(current_path).to eq("/")
      expect(page).to have_content("Message was successfully created")
    end
  end
end
