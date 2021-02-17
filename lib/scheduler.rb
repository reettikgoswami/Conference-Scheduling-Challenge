require_relative "screened_talks"

class Scheduler

  def initialize() 
    @lightnig_talks, @normal_talks = ScreenedTalks::TALK_LIST.partition { |talk| talk.is_lightning_talk }
  end

  def show_conferences 
    puts @lightnig_talks
    puts "==================="
    puts @normal_talks
  end

end