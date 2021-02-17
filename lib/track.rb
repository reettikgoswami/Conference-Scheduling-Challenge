require_relative "session"

class Track 
  attr_reader :track_name, :morning_session, :evening_session

  def initialize(track_number) 
    @track_name = "Track #{track_number}"
    @day = Time.now.day
    @month = Time.now.month
    @year = Time.now.year
    @morning_session = Session.new(@day, @month, @year, 9, 12)
    @evening_session = Session.new(@day, @month, @year, 13, 17)
  end


  def display_track
    all_talks = (@morning_session.talks + @evening_session.talks)
    talk_info_strings = all_talks.map do |talk|
      "#{talk.start_time.strftime("%I:%M %p")} #{talk.subject}"
    end.join("\n")

    "\n#{@track_name}\n\n#{talk_info_strings}\n....."
  end

end