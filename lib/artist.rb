require "pry"
class Artist
    
    @@all = []
    attr_accessor :name 
    def initialize(name)
        @name = name
        @@all << self 
    end

    def songs 
        Song.all.filter do |song| 
            if song.artist
                song.artist == self
            end
        end
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(artist_name)
        does_artist_exist = self.all.find{|artist| artist.name == artist_name}
        does_artist_exist ? does_artist_exist : Artist.new(artist_name)
    end

    def print_songs
        self.songs.each do |song|
            puts song.name
        end
    end

    def self.all
        @@all
    end

end
