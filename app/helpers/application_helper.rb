module ApplicationHelper
  def music_path music
    "/#{music.id}"
  end
end
