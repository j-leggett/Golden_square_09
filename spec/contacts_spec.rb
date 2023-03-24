require 'contacts'

RSpec.describe Contacts do

  it "lists all numbers from an entry" do
  diary = Diary.new
  entry_1 = DiaryEntry.new("monday", "Alex - 05617829177")
  entry_2 = DiaryEntry.new("Alex", "07654567655")
  diary.add(entry_1)
  diary.add(entry_2)
  contact_list = Contacts.new(diary)
  contact_list.extract_numbers
  expect(contact_list.all).to eq "05617829177, 07654567655"
  end

  it "does't list recurring number" do
    diary = Diary.new
    entry_1 = DiaryEntry.new("monday", "Alex - 05617829177")
    entry_2 = DiaryEntry.new("Alex", "07654567655, 05617829177")
    diary.add(entry_1)
    diary.add(entry_2)
    contact_list = Contacts.new(diary)
    contact_list.extract_numbers
    expect(contact_list.all).to eq "05617829177, 07654567655"
    end
end
