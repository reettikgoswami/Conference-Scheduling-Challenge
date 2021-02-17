require_relative "screened_talks"
require_relative "track"

class Scheduler

  def initialize() 
    @tracks = [Track.new(1), Track.new(2)]
    @lightnig_talks, @normal_talks = ScreenedTalks::TALK_LIST.partition { |talk| talk.is_lightning_talk }
  end

  def add_talk_to_tracks_session(talks, session)
    while !talks.empty?
      talk = talks.first
      if !session.is_full? && session.is_addable?(talk)
        session.add_talk(talk)
        talks.shift()
      else
        break
      end
    end
  end

  def schedule_talk_session_wise(track, session)
    add_talk_to_tracks_session(@lightnig_talks, session)
    add_talk_to_tracks_session(@normal_talks, session)
  end


  def schedule_talks 
    @normal_talks = @normal_talks.sort_by { |talk| talk.duration }
    @tracks.each do |track|
      schedule_talk_session_wise(track, track.morning_session)
      schedule_talk_session_wise(track, track.evening_session)
    end
  end

  def conference_time_table 
    schedule_talks
    @tracks.each { |track| puts track.display_track }
  end

end