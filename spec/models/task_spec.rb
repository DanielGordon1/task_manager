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
  it "it has a completed property that defaults to false" do
    task = Task.new(valid_attributes)
    expect(task.completed).to eq(false)
  end
  it "has a completed_at property that defaults to nil" do
    task = Task.new(valid_attributes)
    expect(task.completed_at).to eq(nil)
  end
  it "is only valid if the action is unique and present" do
    Task.create!(valid_attributes)
    task = Task.new(action: "Finish unit tests")

    expect(task).not_to be_valid
  end
  describe "#mark_as_completed" do
    it "marks a task as completed" do
      task = Task.new(valid_attributes)
      task.mark_as_completed
      expect(task.completed).to eq(true)
    end
    it "raises an error message when called more than once" do
      task = Task.new(valid_attributes)
      task.mark_as_completed
      task.save!
      expect(task.mark_as_completed[0]).to eq("This task has already been marked as completed")
    end
  end
  describe '#update_completed_at' do
    it "sets the completed_at attribute to a Date after the task has been marked" do
      task = Task.new(valid_attributes)
      task.mark_as_completed
      task.save
      expect(task.completed_at.class).to eq(ActiveSupport::TimeWithZone)
    end
    it "is a private method" do
      task = Task.new(valid_attributes)
      expect(task.private_methods).to include(:update_completed_at)
    end
    it "can update the completed_at attribute of a task when called" do
      task = Task.new(valid_attributes)
      task.send(:update_completed_at)
      expect(task.completed_at.class).to eq(ActiveSupport::TimeWithZone)
    end
  end
end
