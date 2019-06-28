# frozen_string_literal: true

require 'rails_helper'

describe "listing tasks", type: :feature do
  before :each do
    5.times { |i| Task.create!(action: "task_#{i}") }
  end

  it "allows me to view all tasks at the root" do
    visit '/'
    expect(page).to have_selector('task-item', count: 5)
  end
end
