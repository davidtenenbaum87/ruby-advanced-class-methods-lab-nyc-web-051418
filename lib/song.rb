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
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    @@all.find { |song| song.name == name }
  end

  def self.find_or_create_by_name(name)
    if self.find_by_name(name)
      return self.find_by_name(name)
    else
      return self.create_by_name(name)
    end
  end

  def self.alphabetical
    @@all.sort_by { |song| song.name }
  end

  def self.new_from_filename(film_name)
    artist = film_name.split(" - ")[0]
    song_name = film_name.split(" - ")[1].split(".")[0]
    song = self.new_by_name(song_name)
    song.artist_name = artist
    song
  end

  def self.create_from_filename(film_name)
    artist = film_name.split(" - ")[0]
    song_name = film_name.split(" - ")[1].split(".")[0]
    song = self.create_by_name(song_name)
    song.artist_name = artist
    song
  end

  def self.destroy_all
    @@all.clear
  end

end
