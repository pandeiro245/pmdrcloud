class Track
  def initialize(client_id)
    @client = SoundCloud.new(:client_id => client_id)
  end

  def path_to_id path
    @client.get(
      "/tracks", 
      :limit => 1,
      :q => path
    ).first.id
  end
end

