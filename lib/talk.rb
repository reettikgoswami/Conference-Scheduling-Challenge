class Talk 
   attr_reader :is_lightning_talk

  def initialize(subject, duration) 
    @subject = subject
    @duration = duration
    @is_lightning_talk = ( duration == 5 )
  end


end