module RGSearch
	
	class RGSearchException < Exception
		
		alias to_s message
		
		def initialize(message)
			@message = message
		end
		
		def message
			"RGSearch Error: #{@message}"
		end
		
	end
	
end