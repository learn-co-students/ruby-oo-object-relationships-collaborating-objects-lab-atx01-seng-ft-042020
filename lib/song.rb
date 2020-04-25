require "pry"
require_relative "../lib/artist.rb"
require_relative "../lib/song.rb"
require_relative "../lib/mp3_importer.rb"
class Song
    @@all = []
    attr_accessor :name, :artist  
    def initialize(name)
        @name = name 
        @@all << self 
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        parsed_filename = self.parse_filename(filename)
        song = Song.new(parsed_filename[:name])
        song.artist = Artist.find_or_create_by_name(parsed_filename[:artist])
        song 
    end

    def artist_name=(name)
        song = @@all.find{ |song| 
            if !song.artist.nil? 
                song.artist.name == name 
            end 
        }
        song ? self.artist = song.artist : self.artist = Artist.new(name)
        self.artist
    end

    private
    def self.parse_filename(filename)
        parsed_filename = filename.split(" - ")
        {
            name: parsed_filename[1],
            artist: parsed_filename[0]
        }
    end


end
