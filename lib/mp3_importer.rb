require 'pry'
class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        #binding.pry

        Dir.glob("#{@path}/*.mp3").map {|file| File.basename(file)}
    end

    def import
        self.files.each{ |filename| Song.new_by_filename(filename) }
    end
end