# {{PROBLEM}} Multi-Class Planned Design Recipe


## 1. Describe the Problem

> As a user
> So that I can record my experiences
> I want to keep a regular diary

> As a user
> So that I can reflect on my experiences
> I want to read my past diary entries

> As a user
> So that I can reflect on my experiences in my busy day
> I want to select diary entries to read based on how much time I have and my reading speed

> As a user
> So that I can keep track of my tasks
> I want to keep a todo list along with my diary

> As a user
> So that I can keep track of my contacts
> I want to see a list of all of the mobile phone numbers in all my diary entries

_Put or write the user story here. Add any clarifying notes you might have._


## 2. Design the Class System

_Consider diagramming out the classes and their relationships. Take care to
focus on the details you see as important, not everything. The diagram below
uses asciiflow.com but you could also use excalidraw.com, draw.io, or miro.com_

```ruby
class Diary
  def initialize
  
  end

  def add(entry) #from diary entry

  end

  def read_all
  
  end
end

class DiaryReader
  def initialize(wpm, diary)
  
  end

  def select_entry(time)
  
  end
end

class DiaryEntry

  def initialize(title, contents)

  end

  def title

  end

  def contents

  end

end

class Contacts
  def initialize(diary)

  end

  def extract_numbers

  end

  def all

  end

end

class Task
  def initialize

  end

  def title
  
  end
end

class TaskList
  def initialize

  end

  def add(task)
  
  end

  def list

  end
end

```

## 3. Create Examples as Integration Tests

_Create examples of the classes being used together in different situations and
combinations that reflect the ways in which the system will be used._

```ruby

diary = Diary.new
monday = DiaryEntry.new("title", "I went for a walk")
diary.add(monday)
expect(diary.read_all).to eq ["monday"]

diary = Diary.new
entry_1 = DiaryEntry.new("title", "hello")
entry_2 = DiaryEntry.new("monday", "I went for a walk")
entry_3 = DiaryEntry.new("tuesday", "I went for a walk again")
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
reader = DiaryReader.new(2, diary)
expect(reader.select_entry(2)).to eq entry_2

diary = Diary.new
entry_1 = DiaryEntry.new("title", "hello")
entry_2 = DiaryEntry.new("monday", "I went for a walk")
entry_3 = DiaryEntry.new("tuesday", "I went for a walk again")
entry_4 = DiaryEntry.new("tuesday", "I went for a walk again "*20)
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
reader = DiaryReader.new(10, diary)
expect(reader.select_entry(2)).to eq entry_3

diary = Diary.new
entry_1 = DiaryEntry.new("title", "hello world")
entry_2 = DiaryEntry.new("monday", "I went for a walk")
entry_3 = DiaryEntry.new("tuesday", "I went for a walk again")
entry_3 = DiaryEntry.new("tuesday", "I went for a walk again "*20)
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
reader = DiaryReader.new(1, diary)
expect(reader.select_entry(0)).to raise_error "wpm must be more than 1"

entry_1 = DiaryEntry.new("title", "hello world")
entry_2 = DiaryEntry.new("monday", "I went for a walk")
entry_3 = DiaryEntry.new("tuesday", "I went for a walk again")
entry_3 = DiaryEntry.new("tuesday", "I went for a walk again "*20)
diary.add(entry_1)
diary.add(entry_2)
diary.add(entry_3)
diary.add(entry_4)
reader = DiaryReader.new(10, diary)
expect(reader.select_entry(10)).to eq nil

diary = Diary.new
entry_1 = DiaryEntry.new("monday", "Alex - 05617829177")
entry_2 = DiaryEntry.new("Alex", "07654567655")
diary.add(entry_1)
diary.add(entry_2)
contact_list = Contacts.new(diary)
contact_list.extract_numbers
expect(contact_list.all).to eq "07654567655, 05617829177"

tasks = TaskList.new
task_1 = Tasks.new("walk the dog")
task_2 = Tasks.new("walk the cat")
tasks.add(task)
expect(tasks.list).to eq [task_1, task_2]



## 4. Create Examples as Unit Tests

_Create examples, where appropriate, of the behaviour of each relevant class at
a more granular level of detail._

```ruby
# EXAMPLE

# Constructs a track
track = Track.new("Carte Blanche", "Veracocha")
track.title # => "Carte Blanche"
```

_Encode each example as a test. You can add to the above list as you go._

## 5. Implement the Behaviour

_After each test you write, follow the test-driving process of red, green,
refactor to implement the behaviour._
