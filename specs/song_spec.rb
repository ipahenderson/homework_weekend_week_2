require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class TestSong < Minitest::Test


  def setup
    @hurt = Song.new({title: "Hurt", artist: "Johnny Cash"})
    @ian = Guest.new("Ian", 80, @hurt)
  end


  def test_song_title
    assert_equal("Hurt", @hurt.song_title)
  end

  def test_song_artist
    assert_equal"Johnny Cash", @hurt.song_artist
  end


end
