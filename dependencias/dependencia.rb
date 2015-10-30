class Device
	def initialize(operative_system, inches)
		@operative_system = operative_system
		@inches = inches
		@time = Time.now
	end

	def get_time
		@time = Time.now
	end
end

class Microwave
	def initialize
		@time = Time.now
	end

	def heat_food
		puts "food"
	end

	def get_time
		@time = Time.now
	end
end

module Camara
	def take_a_photo
		puts "Foto con el sistema operativo: #{@operative_system}"
	end
end

class Phone < Device
	include Camara
	def initialize(operative_system, inches, agenda)
		super operative_system, inches
		@agenda = agenda
	end
	def show_agenda
		@agenda.show_contacts
	end
	def call_contact
		puts "Buscar contacto:"
		name = gets.chomp
		num = @agenda.return_number(name)
		if num == nil
			puts "#{name} no esta en la Agenda"
		else
			puts "Llamando a #{name} con numero: #{num}"
		end

	end
end

class Laptop < Device
	def initialitze(operative_system, inches,touchable)
		super operative_system, inches, touchable
		@touchable = touchable
	end
end

class SmartSwatch < Device
	include Camara
	def get_time
		time_molon = "***#{Time.now}***"
	end
end

class Agenda
	def initialize
		@contacts = []
	end

	def add_contact(contact)
		@contacts << contact
	end

	def show_contacts
		@contacts.each do |contact|
			contact.show_contact
		end
	end

	def return_number(name)
		
		cont = @contacts.find {|x|x.name == name} 
		cont.number
	end
end

class Contact
	attr_reader :name
	attr_reader :number 
	def initialize(name, number)
		@name = name
		@number = number
	end

	def show_contact
		puts "#{@name} tiene el numero: #{@number}"
	end
end



c1 = Contact.new("Lluis",99999)
c2 = Contact.new("Raul",22222)
c3 = Contact.new("Pau",55555)
a1 = Agenda.new
a1.add_contact(c1)
a1.add_contact(c2)
a1.add_contact(c3)
p1 = Phone.new("Android", 5, a1)
p1.call_contact
l1 = Laptop.new("Windows", 19, true)
s1 = SmartSwatch.new("iOS", 2)
m1 = Microwave.new
dispositivos = [p1, l1, s1, m1]
dispositivos.each do |dispositivo|
	puts dispositivo.get_time
end