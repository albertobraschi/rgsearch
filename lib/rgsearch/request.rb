module RGSearch

  class Request

    def self.get(url, params = {}, options = {})
			options = {:proxy => proxy?}.merge(options)
			uri = get_uri(url, params)
			response = uri.open(options).collect.join
			Unicode.unescape(response)
		rescue Exception => e
			raise RGSearchException, e.message
		end

		private
		def self.proxy?
			ENV.include?("http_proxy") || ENV.include?("HTTP_PROXY")
		end
		
		def self.to_query(params = {})
			query = []
			params.each { |k, v| query << "#{k}=#{v}" }
			URI.encode(query.join("&"))
		end
		
		def self.get_uri(url, params)
		  uri = URI.parse(URI.encode(url))
			uri.query = to_query(params)
			return uri
		end
    
  end

end
