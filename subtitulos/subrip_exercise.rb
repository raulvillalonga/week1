require 'pry'
require 'time'

class StrReader


  def initialize file
    @file = file
    @file_content = ''
    @subtitles = []
  end

  def start
    read_file
    read_subtitles
    create_subtitle
    break_time
    p @subtitles[0]
    parse_str_to_time
    add_time(2500)
    parse_time_to_str
    p @subtitles[0]
  end

  def read_file
    @file_content = IO.read @file 
  end

  def read_subtitles
    @file_content.split(/^\n/)
  end

  def create_subtitle
    read_subtitles.map do |subtitle|
      result = subtitle.split(/\n/)
      @subtitles << {id: result[0], time: result[1], text: result[2]}
    end
  end

  def break_time
    @subtitles.each do |subtitle|
      result = subtitle[:time].split(/( --> )/)
      subtitle[:time_start] = result[0]
      subtitle[:time_end] = result[2]
    end
  end

  def parse_str_to_time

    @subtitles.each do |subtitle|
      subtitle[:time_start] = Time.parse(subtitle[:time_start]) 
      subtitle[:time_end] = Time.parse(subtitle[:time_end]) 
    end
  end


  def add_time(time)
    time = time / 1000.0 

    @subtitles.each do |subtitle|
      subtitle[:time_start] += time
      subtitle[:time_end] += time
    end
  end

    def parse_time_to_str

    @subtitles.each do |subtitle|
      subtitle[:time_start] = subtitle[:time_start].strftime('%H:%M:%S,%L')
      subtitle[:time_end] = subtitle[:time_end].strftime('%H:%M:%S,%L')
    end
  end

end

class Subtitle

  def initialize id, time_start, time_end, text
    @id = id
    @time_start = time_start
    @time_end = time_end
    @text = text
  end

  def return_data
    "#{@id}\n#{time_start} --> #{time_end}\n#{text}"
  end
end


sub = StrReader.new('subtitle.str').start

#binding.pry