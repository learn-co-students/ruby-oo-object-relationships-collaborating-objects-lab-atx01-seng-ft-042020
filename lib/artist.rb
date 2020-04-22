class Artist
    @@all = []
    
    attr_accessor :name
    def initialize(name)
        @name = name
        @@all << self
    end

    def songs
        Song.all.select {|song| song.artist == self}
    end

    def add_song_by_name(name)
        song = Song.new(name)
        song.artist = self
    end

    def add_song(song)
        song.artist = self
    end

    def self.find_or_create_by_name(name)
        artist = self.all.find {|a| a.name == name}
        artist != nil ? artist : Artist.new(name)
    end

    def print_songs
        songs.each {|s| puts s.name}

    end

    def self.song_count
        Song.all.count
    end

    def self.all
        @@all
    end
end