# frozen_string_literal: true

class MovieService
  def self.top_20_movies
    response = connection.get("/3/movie/top_rated?api_key=#{ENV['api_key']}")
    # results = (parse_response(movies))[:results]
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results]
  end

  def self.movie_by_keyword(query)
    response1 = connection.get("/3/search/movie?query=#{query}&api_key=#{ENV['api_key']}")
    response2 = connection.get("/3/search/movie?query=#{query}&page=2&api_key=#{ENV['api_key']}")

    data1 = JSON.parse(response1.body, symbolize_names: true)
    data2 = JSON.parse(response2.body, symbolize_names: true)

    data1[:results] + data2[:results]
  end

  def self.movie_details(id)
    response = connection.get("/3/movie/#{id}?api_key=#{ENV['api_key']}")
    data = JSON.parse(response.body, symbolize_names: true)
  end

  def self.movie_cast(id)
    response = connection.get("/3/movie/#{id}/credits?api_key=#{ENV['api_key']}")
    data = JSON.parse(response.body, symbolize_names: true)
    data[:cast]
  end

  def self.movie_reviews(id)
    response = connection.get("/3/movie/#{id}/reviews?api_key=#{ENV['api_key']}")
    data = JSON.parse(response.body, symbolize_names: true)
    data[:results]
  end

  def self.connection
    Faraday.new(url: 'https://api.themoviedb.org')
  end
end

# conn = Faraday.new(url: "https://api.propublica.org") do |faraday|
#   faraday.params["X-API-KEY"] = ENV['api_key']
# end
#
# response = conn.get("/congress/v1/members/house/#{state}/current.json")
#
# json = JSON.parse(response.body, symbolize_names: true)

# response = conn.get("/3/movie/top_rated?api_key=#{ENV['movie_db_key']}")
