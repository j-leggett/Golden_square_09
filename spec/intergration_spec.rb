require 'diary'
require 'diary_entry'
require 'diary_reader'

RSpec.describe "integration" do

  it "adds and lists diary entries" do
  diary = Diary.new
  monday = DiaryEntry.new("title", "I went for a walk")
  tuesday = DiaryEntry.new("title", "I went for a jog")
  diary.add(monday)
  diary.add(tuesday)
  expect(diary.entries).to eq [monday, tuesday]
  end

  it "selects the correct entry to read based on time and wpm" do
  diary = Diary.new
  reader = DiaryReader.new(2, diary)
  entry_1 = DiaryEntry.new("title", "hello")
  entry_2 = DiaryEntry.new("monday", "I went for a")
  entry_3 = DiaryEntry.new("tuesday", "I went for a walk again")
  diary.add(entry_1)
  diary.add(entry_2)
  diary.add(entry_3)
  expect(reader.select_entry(2)).to eq entry_2
  end

  it "selects correctly" do
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
      end

  
end