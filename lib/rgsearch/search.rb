module RGSearch

	class Search

		def self.web(query, options = {})
			find 'web', query, options
		end

		def self.images(query, options = {})
			find 'images', query, options
		end

		def self.news(query, options = {})
			find 'news', query, options
		end

		def self.blogs(query, options = {})
			find 'blogs', query, options
		end

		def self.videos(query, options = {})
			find 'video', query, options
		end

		def self.books(query, options = {})
			find 'books', query, options
		end
		
		def self.local(query, options = {})
			find 'local', query, options
		end

		private
		def self.find(engine, query, options)
			url = URI.encode "#{API_URL}/#{engine}"
			validate options, query
			data = Request.get(url, options)
			ResultSet.new JSON.parse(data)
		end
		
		def self.validate(options, query)
			raise RGSearchException, 'key is not specified' unless RGSearch.key
			raise RGSearchException, 'start is invalid' if options[:start] and options[:start] < 0
			raise RGSearchException, 'result size is invalid' unless ["small", "large"].include? options[:rsz]
			options[:q] = query
			options[:v] = API_VERSION
			options[:key] = RGSearch.key			
		end

	end

end