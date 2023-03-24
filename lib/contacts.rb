class Contacts
  def initialize(diary)
    @diary = diary
    @contacts = []
  end

  def extract_numbers
    @contacts = numbers = @diary.entries.map do |entry|
      extract_from(entry)
    end
  end

  def all
    @contacts.flatten.uniq.join(", ")
  end

  def extract_from(entry)
    return entry.contents.scan(/0[0-9]{10}/)
  end


end