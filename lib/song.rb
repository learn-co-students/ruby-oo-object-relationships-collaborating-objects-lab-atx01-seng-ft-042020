class Song 
    @@all = []

    attr_accessor :name, :artist
    def initialize(name)
        @name = name
        @@all << self
    end

    def artist_name=(name)
        @artist = Artist.find_or_create_by_name(name)
    end

    def self.new_by_filename(filename)
        parsed = filename.gsub(/.mp3/, "").split('-')
        song = Song.new(parsed[1].strip)
        song.artist_name=(parsed[0].strip)
        song
    end

    def self.all 
        @@all
    end
end
