class Rental < ActiveRecord::Base
belongs_to :client
belongs_to :vhs

def due_date
    # binding.pry
    self.created_at + 7.days 
end

def self.past_rentals_currently_available_vhs
    self.select{|rental| !rental.current}.map(&:vhs)
    # current means it's currently rented
    # "!" means if the current attribute of rental evaluates to false
end

def past_due_date?
    self.due_date < self.updated_at
    
    # Updated_at it means it’s the date either last checked out (if its the same date with created_at), or returned (if it’s not the same with created_at) 
    # when the person return the rental, that time will be the updated_at 
    
end

def self.past_due_date
    self.select{|rental| rental.past_due_date?}
    # returns a list of all the rentals past due date, currently rented or rented in the past return a list of all rentals past due date and currently rent return a list of all rentals past due date and its been returned now
    # return a list of all rentals past due date
end

def self.currently_past_due_date
    self.select{|rental| rental.current && rental.past_due_date?}
   # currently rented => past due date or no
end

end


