class Genre < ActiveRecord::Base
    has_many :movie_genres
    has_many :movies, through: :movie_genres
    
def number_of_movies #(instance method)
#Find how many movies is in this genre (e.g. there are 5 movies is in adaptation genre)
#helper method (in order to returns a list of 5 most popular genres based on number of movies)
    self.movies.count
end

def self.most_popular
    self.all.sort_by{|genre| -genre.number_of_movies}[0..4] #[0..4]list of 5
    # hint: sort_by sorts from the least to the most 🌟 
    # 🌟 You have to put "-” in front of the sorting function, that will reverse 
end

def average_movie_length
    sum = self.movies.sum(&:length) #The total length of all the movies in this genre
    return 0 if sum == 0 #("==" operator, also known as equality or double equal, it will return 0 if it's is true)
    average = sum/self.movies.count.to_f.round(2)
end

def self.longest_movies
    self.all.max_by(&:average_movie_length)
    #Genre.longest_movies - returns a genre whose movies length average is the highest (remember to also test it with an instance of a Genre that does not have any movies associated)
end
end


