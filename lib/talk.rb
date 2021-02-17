class Talk 
  attr_accessor :start_time
  attr_reader :is_lightning_talk, :subject, :duration

  def initialize(subject, duration) 
    @subject = subject
    @duration = duration
    @is_lightning_talk = ( duration == 5 )
    @start_time = nil
  end


end