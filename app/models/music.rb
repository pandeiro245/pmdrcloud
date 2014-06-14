class Music < ActiveRecord::Base
  def self.save_from_path path
    client_id = '2b9312964a1619d99082a76ad2d6d8c6'
    id = Track.new(client_id).path_to_id(path)
    Music.find_or_create_by(soundcloud_id: id)
  end

  def sync
    track = Track.find(self.soundcloud_id)
    self.title = track.title
    self.save
  end
end
