module RGSearch

	class Result < BaseResult

		def initialize(data = {})
			@data = data
			@data.each { |k, v| set_parameter(k, v) }
		end
		
		def to_s
			@data.inspect
		end
		
	end
	
end