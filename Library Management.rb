require "rubygems"
require "./Library"
require "date"
require "pry"

class LibraryOperation
	attr_accessor :create_book, :date
	include Library
	
	def initialize
		@date=Date.today
		@create_book=Create_book.new
		@create_book.display_book_details
=begin		puts "Do you want to issue book or return book (i/r)?"
		opt=gets.chomp!
		if opt=='r'
			return_book
		elsif opt=='i'
			issue_book
=end		end
	end


	def issue_book(val)
		#puts "Which book u want?? Enter the any details"
		#puts "1.Book ID 2.ISBN 3.Name 4.Author"
		value=val.capitalize
		#puts value
		return_value=search_book(value)
		if return_value==nil
			puts "Book not found"
		else
			book=return_value[0]
			index=return_value[1]

			key=book.keys[0]
			#puts @create_book.book[index][key]
		
			if @create_book.book[index][key][3]=="available"
				@create_book.book[index][key][3]="issued"
				@create_book.book[index][key][4]=date
				@create_book.book[index][key][5]=(date+15)
				puts "Book available.\nBook issue date is "+date.to_s
				puts "Book return date is "+(date + 15).to_s
			else
				puts "Sorry book is not available"
			end
			puts @create_book.book
		end
	end


	def search_book(arg)
		i=0
		begin 
			if @create_book.book[i].key?(arg) 
				#puts "Book Found"
				return [@create_book.book[i],i]

			else
				@create_book.book[i].each_value do |isbn,name,author,status|
					if isbn==arg||name==arg||author==arg
						#puts "Book found"
						return [@create_book.book[i] ,i]
					end
				end
			end
			i+=1
		end while i<5
			end
	

	def return_book(value)
		#puts "Which book you want to return?"
		book_return=value.capitalize
		return_value=search_book(book_return.to_s)
		 
		book=return_value[0]
		index=return_value[1]

		key=book.keys[0]
		#puts @create_book.book[index][key][4]
		
		if @create_book.book[index][key][3]=="issued"
			#puts @create_book.book[index][key][5]
			if @create_book.book[index][key][5]>=date
				@create_book.book[index][key][3]="available"
				@create_book.book[index][key][5]=""
				@create_book.book[index][key][4]=""
				puts "Book deposited. Thank you"
			else
				puts "Ohhh.. You are late. You have to pay fine as 5Rs/Day"
			end
		else
			p "Book not in record"
		end
		puts @create_book.book
	end
	
end

lib=LibraryOperation.new()
binding.pry