# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Task, type: :model do
  let(:valid_attributes) do
    {
      action: "Finish unit tests"
    }
  end
  it "has an action" do
    task = Task.new(valid_attributes)
    expect(task.action).to eq("Finish unit tests")
  end
  it "it has a done property that defaults to false" do
    task = Task.new(valid_attributes)
    expect(task.done).to eq(false)
  end
  it "has a finished_at property that defaults to nil" do
    task = Task.new(valid_attributes)
    expect(task.finished_at).to eq(nil)
  end
  it "is only valid if the action is unique and present" do
    Task.create!(valid_attributes)
    task = Task.new(action: "Finish unit tests")

    expect(task).not_to be_valid
  end
end
