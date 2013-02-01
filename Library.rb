require "pry"
module Library
	class Books
			@@id=0
		
		def set_books_attributs(isbn,name,author,status,issue_date,return_date)
			#@hash={:ISBN=>isbn,:name=>name, :author=>author,:status=>status}
			@@id+=1
			@hash={@@id.to_s=>[isbn,name,author,status,issue_date,return_date]}
		end
	end

	class Create_book
	  attr_accessor :book, :obj1
	 
		def create_book
			@book=Books.new
			@book=Array.new(4)
			@obj1=Books.new

			@book[0]=@obj1.set_books_attributs("B01","C++","Balaguru","issued",Date.new(2013,01,17),Date.new(2013,02,01))
			@book[1]=@obj1.set_books_attributs("B02","Vb","Gaytri","available","","")
			@book[2]=@obj1.set_books_attributs("B03","C#","Sagar","available","","")
			@book[3]=@obj1.set_books_attributs("B04","Java","Prasad","available","","")
			@book[4]=@obj1.set_books_attributs("B05",".net","Rohinee","available","","")
		end

		def display_book_details
				create_book
				puts @book
				puts "=============Boooks added============="
		end

	end

	#c=Create_book.new
	#c.display_book_details
	  
end
