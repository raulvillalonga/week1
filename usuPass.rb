class Checker
	def initialize (name, pass)
		@name = name
		@pass = pass
		@t_name = ""
		@t_pass = ""
	end

	def get_data
			puts "Entra nombre de usuario"
			@t_name = gets.chomp
			puts "Entra el pas"
			@t_pass = gets.chomp
	end

	def correct?
		if name_correct?(@name, @t_name) && pass_correct?(@pass, @t_pass)
			puts "Los datos son correctos"
		else
			puts "Los datos NO son correctos"
			get_data
			correct?
		end
	end

	def name_correct? (name, t_name)
		name == t_name
	end

	def pass_correct? (pass, t_pass)
		pass == t_pass
	end
end

compo = Checker.new("raul", "123")
compo.get_data
compo.correct?

