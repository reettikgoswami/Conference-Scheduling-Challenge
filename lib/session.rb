class Session 
  attr_accessor :talks

  def initialize(day, month, year, start_time, end_time)
      @start_time = Time.local(year, month, day, start_time)
      @end_time = Time.local(year, month, day, end_time)
      @talks = []
      @remaining_time = ( @end_time - @start_time ) / 60
  end

  def add_talk(talk) 
    total_session_duration = (@end_time.to_i - @start_time.to_i) / 60
    booked_till = @start_time + ((total_session_duration - @remaining_time) * 60)
    talk.start_time = booked_till
    @remaining_time -= talk.duration
    @talks << talk
  end

  def is_full? 
    @remaining_time == 0
  end

  def is_addable?(talk) 
    @remaining_time - talk.duration >= 0
  end


end


