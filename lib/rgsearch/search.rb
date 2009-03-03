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
			options[:q] = query
			options[:v] = API_VERSION
			options[:key] = RGSearch.key
			data = Request.get(url, options)
			ResultSet.new JSON.parse(data)
		end

	end

end