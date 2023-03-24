require 'task'

RSpec.describe Task do

  it "returns the task" do
    task_1 = Task.new("walk the dog")
    expect(task_1.title).to eq "walk the dog"
  end
end