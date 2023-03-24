require 'task'
require 'task_list'

RSpec.describe "task integration" do

  it "lists the added tasks" do
  tasks = TaskList.new
  task_1 = Task.new("walk the dog")
  task_2 = Task.new("walk the cat")
  tasks.add(task_1)
  tasks.add(task_2)
  expect(tasks.list).to eq [task_1, task_2]
  end
end
