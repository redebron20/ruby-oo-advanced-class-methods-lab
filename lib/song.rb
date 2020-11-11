require 'pry'
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new
    song.name = name
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.find_by_name(name) || self.create_by_name(name)
    # @@all.find do |song|
    #   if song.name == name
    #     self.find_by_name
    #   else
    #     self.create_by_name
    #   end
    # end
  end

  def self.alphabetical
    # song_arr = []
    # @@all.each {|song| song_arr << song.name}
    # song_arr.sort!
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
    song = self.new
    song.name = filename.split(" - ")[1].chomp!(".mp3")
    song.artist_name = filename.split(" - ")[0]
    song
  end

  def self.create_from_filename(filename)
    song = self.new
    self.all << self.new_from_filename(filename)
  end

  def self.destroy_all
    self.all.clear
  end

end
