module RGSearch

	class Request

		def self.get(url, options = {})
			uri = URI.parse URI.encode(url)
			uri.query = to_query options
			request = Net::HTTP::Get.new uri.request_uri
			response = connection.start(uri.host) { |http| http.request request }
			Unicode.unescape(response.body)
		rescue Exception => e
			raise RGSearchException, e.message
		end

		private		
		def self.connection()
			Net::HTTP.Proxy RGSearch.proxy_host, RGSearch.proxy_port,
							RGSearch.proxy_user, RGSearch.proxy_pass
		end

		def self.to_query(options = {})
			query = []
			options.each { |k, v| query << "#{k}=#{v}" }
			URI.encode query.join('&')
		end
		
	end

end