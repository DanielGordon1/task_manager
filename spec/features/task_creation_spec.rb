# frozen_string_literal: true

require 'rails_helper'

describe "creating a task", type: :feature do
  it "allows me to create a task at the root url" do
    visit '/'
    within("#new_task") do
      fill_in 'task_action', with: 'Finish task manager'
    end
    click_button 'Create task'
    expect(page).to have_content 'Succesfully created a new task.'
  end
  it "does not allow me to create an invalid task at the root url" do
    visit '/'
    within("#new_task") do
      fill_in 'task_action', with: ''
    end
    click_button 'Create task'

    expect(page).to have_content "Action can't be blank"
  end
end
