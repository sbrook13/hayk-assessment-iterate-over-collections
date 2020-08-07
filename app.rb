require 'pry'

class Company
    attr_accessor :name, :size

    @@all = []

    def initialize(name, size)
        @name = name
        @size = size
        @@all << self
    end

    def self.all
        @@all
    end    

end

companies = [
    Company.new('Alpha', 30),
    Company.new('Beta', 300),
    Company.new('Delta', 3000)
]

# Generate a list of strings with the name and size (eg. "Alpha - 30")
def name_and_size(company_class)
    company_data = company_class.all.map do |each_company|
        each_company.name + " - " + each_company.size.to_s
    end    
    puts company_data    
end    

name_and_size(Company)

# Combine all the sizes with reduce

def total_size(companies_class)
    companies_class.all.reduce(0) do |sum, company|
        sum + company.size
    end
end        

puts total_size(Company.all)

# Filter the list to show only companies over 100
def companies_over_100(companies_class)
    over_100 = []
    companies_class.all.select do |each_company|
        if each_company.size >100
            over_100 << each_company.name
        end    
    end
    over_100
end  

puts companies_over_100(Company.all)

# Find the company named "Beta"

def company_by_name(companies, name)
    companies.all.find do |each_company|
        each_company.name == name
    end
end

puts company_by_name(Company, "Beta")

# Find the largest company

def largest_company(company_class)
    company_class.all.sort_by {|obj| -obj.size}.first.name
end


# Sort the companies from largest to smallest
def sort_large_to_small(company_class)
    company_class.all.sort_by {|obj| -obj.size}
end    
