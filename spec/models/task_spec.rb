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
  describe "#mark_as_done" do
    it "marks a task as done" do
      task = Task.new(valid_attributes)
      task.mark_as_done
      expect(task.done).to eq(true)
    end
    it "raises an error message when called more than once" do
      task = Task.new(valid_attributes)
      task.mark_as_done
      task.save!
      expect(task.mark_as_done[0]).to eq("This task has already been marked as done")
    end
  end
  describe '#update_finished_at' do
    it "sets the finished_at attribute to a Date after the task has been marked" do
      task = Task.new(valid_attributes)
      task.mark_as_done
      task.save
      expect(task.finished_at.class).to eq(ActiveSupport::TimeWithZone)
    end
    it "is a private method" do
      task = Task.new(valid_attributes)
      expect(task.private_methods).to include(:update_finished_at)
    end
    it "can update the finished_at attribute of a task when called" do
      task = Task.new(valid_attributes)
      task.send(:update_finished_at)
      expect(task.finished_at.class).to eq(ActiveSupport::TimeWithZone)
    end
  end
end
