class Artist

    attr_accessor :name

    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def add_song(song)
        song.artist = self
    end

    def songs
        Song.all.select {|e| e.artist == self}
    end

    def self.find_or_create_by_name(name)
         self.all.detect {|i| i.name == name} || Artist.new(name)
    end

    def print_songs
        self.songs.each {|i| puts i.name}
    end

end