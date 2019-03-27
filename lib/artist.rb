require 'pry'

class Artist
  attr_accessor :name, :songs
  attr_reader :genres

  @@all = []
  @@genres = []

  def initialize(name, genre = nil)
    @name = name
    @songs = []
    @@genres << genre unless genre.nil?
    @@all << self
    # binding.pry
  end

  def genres
    genre_list = []
    self.songs.each do |song|
      if song.artist == self
        genre_list << song.genre
      end
    end
    @@genres = genre_list.uniq
  end

  def songs
    @songs
  end

  def add_song(song)
    self.songs << song unless @songs.include?(song)
    song.artist = self unless song.artist == self
    song
  end

  def self.all
    @@all
  end

  def save
    @@all << self
  end

  def self.destroy_all
    @@all.clear
  end

  def self.create(name)
    created = self.new(name)
    created.save
    created
  end


end
