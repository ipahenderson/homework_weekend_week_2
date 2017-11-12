require('minitest/autorun')
require('minitest/rg')
require_relative('../room.rb')
require_relative('../guest.rb')
require_relative('../song.rb')

class TestGuest < Minitest::Test


  def setup
    @mj_room = Room.new("MJ Room",10)
    @mercury_suite = Room.new("Mercury Suite",6)
    @hurt = Song.new({title: "Hurt", artist: "Johnny Cash"})
    @show_me_heaven = Song.new({title: "Show Me Heaven", artist: "Maria McKee"})
    @ian = Guest.new("Ian", 80, @hurt)
    @flo = Guest.new("Flo", 40, @show_me_heaven)
  end


  def test_guest_name
    assert_equal("Ian", @ian.guest_name)
  end

  def test_guest_money
    assert_equal(80, @ian.guest_money)
  end

  def test_enough_money__true
    assert_equal(true, @ian.enough_money(65))
  end

  def test_enough_money__false
    assert_equal(false, @flo.enough_money(65))
  end

  def test_pay__successful
    @ian.pay(60)
    assert_equal(20, @ian.guest_money)
  end

  def test_pay__unsuccessful
    @ian.pay(100)
    assert_equal(80, @ian.guest_money)
  end

  def test_got_fav_song__present
    @mj_room.add_song(@hurt)
    assert_equal("Whoo!", @ian.got_fav_song(@mj_room))
  end

  def test_got_fav_song__absent
    @mj_room.add_song(@show_me_heaven)
    assert_equal("Aww!", @ian.got_fav_song(@mj_room))
  end


end
