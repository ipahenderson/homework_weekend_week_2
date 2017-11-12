require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class TestRoom < Minitest::Test


  def setup
    @mj_room = Room.new("MJ Room",10)
    @mercury_suite = Room.new("Mercury Suite",6)
    @solo_room = Room.new("Solo Room", 1)
    @hurt = Song.new({title: "Hurt", artist: "Johnny Cash"})
    @show_me_heaven = Song.new({title: "Show Me Heaven", artist: "Maria McKee"})
    @ian = Guest.new("Ian", 80, @hurt)
    @flo = Guest.new("Flo", 40, @show_me_heaven)
  end

  def test_room_name
    assert_equal("MJ Room", @mj_room.room_name)
  end

  def test_room_capacity
    assert_equal(10, @mj_room.capacity)
  end

  def test_seats
    @mj_room.check_in(@ian)
    assert_equal([@ian], @mj_room.seats)
  end
  
  def  test_room__empty
    assert_equal([], @mj_room.seats)
  end

  def test_room__has_guests
    @mj_room.check_in(@ian)
    assert_equal(1, @mj_room.seats.count)
  end

  def test_room__free_space
    @mj_room.check_in(@ian)
    assert_equal(true, @solo_room.enough_space)
  end

  def test_room__full
    @solo_room.check_in(@ian)
    @solo_room.check_in(@flo)
    assert_equal(false, @solo_room.enough_space)
  end

  def test_add_to_song_list__no_duplicate
    @mj_room.add_song(@hurt)
    assert_equal([@hurt], @mj_room.song_list)
  end

  def test_add_to_song_list__duplicate
    @mj_room.add_song(@hurt)
    @mj_room.add_song(@show_me_heaven)
    @mj_room.add_song(@hurt)
    assert_equal(2 , @mj_room.song_list.count)
  end







end
