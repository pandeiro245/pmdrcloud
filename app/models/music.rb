class Music < ActiveRecord::Base
  def self.add track_id
    Music.find_or_create_by(soundcloud_id: track_id)
  end

  def sync
    track = Track.find(self.soundcloud_id)
    self.title = track.title
    self.save
  end
end
