class Track
  def initialize(client_id)
    @client = SoundCloud.new(client_id: client_id)
  end

  def self.find id
    client_id = '2b9312964a1619d99082a76ad2d6d8c6'
    client = SoundCloud.new(client_id: client_id)
    client.get(
      "/tracks/#{id}"
    )
  end

  def self.search q
    client_id = '2b9312964a1619d99082a76ad2d6d8c6'
    client = SoundCloud.new(client_id: client_id)
    client.get(
      "/tracks", 
      :duration => 'long',
      :q => q
    )
  end

  def path_to_id path
    @client.get(
      "/tracks", 
      :limit => 1,
      :q => path
    ).first.id
  end
end

