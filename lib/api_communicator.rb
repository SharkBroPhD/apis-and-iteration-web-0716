require 'rest-client'
require 'pry'
require 'JSON'

def get_character_movies_from_api(character)
  all_characters = RestClient.get('http://www.swapi.co/api/people/')
  character_hash = JSON.parse(all_characters)

  character_films=[]

  character_hash["results"].each do |person|
    # binding.pry
    if person["name"].downcase==character
      character_films=person["films"]
    end
  end

  character_films.collect do |film|
    current_film=RestClient.get("#{film}")
    JSON.parse(current_film)
  end
end

def parse_character_movies(films_hash)
  films_hash.each do |film|
    puts film["title"]
  end
end

# def parse_character_movies(films_hash)
#   sw_movies=[]
#   films_hash.each do |film|
#     sw_movies<<film["title"]
#     sw_movies.sort_by do |movies|
#       film["release_date"][0..4].to_i
#     end
#   puts sw_movies
#   end

  # sw_movies=sw_movies.sort_by do |movie|
  #   sw_hash={"A New Hope"=>1977,
  #   "Empire Strikes Back"=>1980,
  #   "Return of the Jedi"=>1983,
  #   "The Phantom Menace"=>1999,
  #   "Attack of the Clones"=>2002,
  #   "Revenge of the Sith"=>2005,
  #   "The Force Awakens"=>2016}
  # end

  # puts sw_movies




def show_character_movies(character)
  films_hash = get_character_movies_from_api(character)
  # binding.pry
  parse_character_movies(films_hash)
end

## BONUS

# that `get_character_movies_from_api` method is probably pretty long. Does it do more than one job?
# can you split it up into helper methods?
