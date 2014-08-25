class Song 
  attr_accessor :title, :play_count, :album, :artist, :genre, :id, :track_number

  def initialize(params= {})
    self.id = params[:id]
    self.title = params[:title]
    self.play_count = params[:play_count]
    self.album = params[:album]
    self.artist = params[:artist]
    self.genre = params[:genre]
  end

  def to_s
    s = "**************************"
    s << "\nID: #{id}"
    s << "\nTitle: #{title}"
    s << "\nAlbum: #{album}"
    s << "\nArtist: #{artist}"
    s << "\nGenre: #{genre}"
    s << "\nPlay count: #{play_count}"
    s << "\n**************************"
    s
  end

end