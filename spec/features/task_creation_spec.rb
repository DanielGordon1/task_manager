# frozen_string_literal: true

require 'rails_helper'

describe "creating a task", type: :feature do

  it "allows me to create a task at the root url" do
    visit '/'
    within("#new_task") do
      fill_in 'action', with: 'Finish task manager'
    end
    click_button 'Create task'
    expect(page).to have_content 'Success'
  end
end
