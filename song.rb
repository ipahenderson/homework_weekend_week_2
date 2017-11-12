class Song
  attr_reader :song


  def initialize(song)
    @song = song
  end

  def song_title
    return @song[:title]
  end

  def song_artist
    return @song[:artist]
  end


end
