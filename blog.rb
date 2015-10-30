class Blog
	def initialize()
		@posts = []
	end

	def add_post(post)
		@posts << post
	end

	def sort_posts(arr_posts)
			sorted_posts = arr_posts.sort_by {|post|post.date}
			return sorted_posts.reverse
	end

	def create_front_page(arr_posts)
			return sort_posts(arr_posts)
	end

	def publish_front_page
			posts_por_pagina = 3
			pagina_actual = 0
			numero_paginas = (@posts.length / posts_por_pagina.to_f).ceil
			case_caracter = 'N'

			while case_caracter != 'S'
				if (case_caracter == 'N')
					pagina_actual = pagina_actual + 1 
				else
					pagina_actual = pagina_actual - 1
				end

				sorted_posts = create_front_page(@posts)
				sorted_posts[((pagina_actual*posts_por_pagina) - posts_por_pagina)..((pagina_actual*posts_por_pagina)-1)].each do |post|
					post.show_post
				end
				(1..numero_paginas).each do |i|
				   if(i == pagina_actual) 
				   	print "(#{i})"
				   else
				   	print " #{i} "
				   end
				end
				puts "\n Pulsa (P)evius, (N)ext o (S)alir"
				case_caracter = gets.chomp
			end
	end
end

class Post
	attr_accessor :date
  def initialize(title, date, text)
  	@title = title
  	@date = date
  	@text = text
  end

  def show_post
  	puts "Post #{@title}"
  	puts "**************"
  	puts "Post #{@text}"
  	puts "----------------"

  end

end

class PostSponsored < Post

  def show_post
  	puts "******Post #{@title}******"
  	puts "**************"
  	puts "Post #{@text}"
  	puts "----------------"

  end

end

blog = Blog.new
blog.add_post PostSponsored.new("title 2", "151027", "2 text")
blog.add_post Post.new("title 1", "151025", "1 text")
blog.add_post Post.new("title 3", "151028", "3 text")
blog.add_post PostSponsored.new("title 4", "151029", "4 text")
blog.add_post Post.new("title 5", "151030", "5 text")
blog.add_post Post.new("title 6", "151101", "6 text")
blog.add_post PostSponsored.new("title 7", "151102", "7 text")
blog.add_post PostSponsored.new("title 8", "151103", "8 text")

blog.publish_front_page