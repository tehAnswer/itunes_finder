require "rexml/document"
require "etc"
require_relative "song"
require_relative "array"

class XmlParser

  attr_accessor :songs

  def initialize (filepath)
    @songs = []
    File.open(filepath) do |file|
      doc = REXML::Document.new(file)
      REXML::XPath.each(doc, '/plist/dict/dict/dict') do |node|

        @values = node.elements.to_a.odd_values
        @keys = node.elements.to_a.even_values.map { |node| node.text }

        params = {
          title: name_value,
          id: album_value,
          album: album_value,
          artist: artist_value,
          play_count: play_count_value.to_i,
          genre: genre_value
        }

        @songs << Song.new(params)
		  end
		end
	end

  def method_missing (name, params= {})
    search_key = name.to_s.split("_").clip.each {|word| word.capitalize!}.join (" ")
    index = @keys.index(search_key)
    index.nil? ? "" : @values[index].text
  end
end