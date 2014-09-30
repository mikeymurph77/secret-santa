require "csv"
require "pp"

class SecretSanta
  def initialize(file_name)
    @file_name = file_name    
  end

  def run
    read
    pair
  end

  def read
    @players = {}

    CSV.foreach(@file_name, headers: true) do |row|
      first_name = row["First Name"]
      last_name = row["Last Name"]
      email = row["Email"]

      if ! @players.key?(last_name)
        @players[last_name] = []
      end

      @players[last_name] << first_name
    end

    @players
  end

  def pair
    puts @players.values.sample
  end
end

secret_santa = SecretSanta.new("players.csv")
secret_santa.run
http://open.spotify.com/track/2eJyQI0nr69AtxHsXf5wZj
