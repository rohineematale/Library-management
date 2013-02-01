require 'rubygems'
class Person
	attr_accessor :person_name, :person_addr

	def create_person(name,addr)
		@person_name=name
		@person_addr=addr
	end

	def display_person_details
		#create_person(@name,@addr)
		puts "#{@person_name} #{@person_addr}"
	end

end

class Employee < Person
	attr_accessor :emp_id, :emp_designation
	
	def create_employee(id, designation)
		@emp_id=id
		@emp_designation=designation
	end

	def display_employee_details
		#create_employee(@id,@designation)
		puts "#{@emp_id} #{@emp_designation}"
	end

end

class Student < Person
	attr_accessor :student_roll_noo, :student_standard
	def create_student(roll_no, std)
		@student_roll_noo=roll_no
		@student_standard=std
	end

	def display_student_details
		#create_student(@roll_no,@std)
		puts "#{@student_roll_noo} #{@student_standard}"
	end

end

emp=Employee.new
emp.create_person("rohi","sanpada")
emp.create_employee("E101","manager")
emp.display_person_details
emp.display_employee_details

student=Student.new
student.create_person("sagar","sewri")
student.create_student("E102","manager")
student.display_person_details
student.display_student_details