# frozen_string_literal: true

require 'rails_helper'

describe "Marking a task as done", type: :feature do
  before :each do
    5.times { |i| Task.create!(action: "task_#{i}") }
  end

  scenario "allows me to mark a task as completed" do
    visit '/'
    expect(page).to have_selector('.fa-square', count: 5)
    task_to_mark = Task.last

    within("div[data-task-id='#{task_to_mark.id}']") do
      click_on('Complete')
    end
    # Check if completed in DOM
    expect(page).to have_selector('.fa-check-square', count: 1)
    # Check if succes message is present
    expect(page).to have_content('Succesfully completed this task ✅.')
    # Check if finished at is present in DOM
    expect(page).to have_selector('.finished-at', count: 1)
  end
end
