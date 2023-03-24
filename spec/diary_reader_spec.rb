require 'diary_reader'

RSpec.describe DiaryReader do

  it "fails if diary is empty" do
    reader = DiaryReader.new(60, nil)
    expect{ reader.select_entry(10)}.to raise_error "no entries to choose from"
  end
end
    