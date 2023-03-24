class DiaryReader
  def initialize(wpm, diary)
    @wpm = wpm
    @diary = diary
  end

  def all 
    @diary
  end

  def calculate_reading_time(entry)
    return (count_words(entry) / @wpm.to_f).ceil
  end

  def count_words(entry)
   return entry.contents.split(" ").length
  end

  def select_entry(time) 
    fail "no entries to choose from" if @diary.nil?
    readable_entries = @diary.entries.reject do |entry|
      calculate_reading_time(entry) > time
    end
    return readable_entries.max_by do |entry|
      count_words(entry)
    end
  end


end