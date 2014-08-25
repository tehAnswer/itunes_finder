require "etc"
require_relative "itunes_finder/xml_parser"


class ItunesFinder

	attr_reader :songs

	def initialize(&block)
		@songs = XmlParser.new("/Users/#{Etc.getlogin}/Music/iTunes/iTunes\ Music\ Library.xml").songs
		self.instance_eval(&block) if block_given?
	end

	def top_five(array = @songs)
		puts "Top five songs"
		puts "---------------"
		array.sort { |x, y| x.play_count <=> y.play_count}.reverse![0..4].
		  each_with_index { |song, index| puts "#{index + 1}: #{song.title} (\##{song.play_count} times.)\n"}
	end

  def get_songs(artist)
    @songs.select { |song| song.artist == artist }
  end

	def method_missing(name, params = {})
    puts name.to_s
    raise "NoMethodError" unless name.to_s.include? "songs"
    artist = name.to_s.split("_").clip.each {|word| word.capitalize!}.join (" ")
    get_songs(artist)
	end	

end


