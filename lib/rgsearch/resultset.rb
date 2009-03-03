module RGSearch

	class ResultSet < BaseResult

		attr_reader :results, :cursor

	    def initialize(data)
			@results = []
			@cursor = Result.new
			data.each do |k, v|
				if k == 'responseData' and v != nil
					v.each do |k, v|
						if k == 'results'
							v.each do |result|
								@results << Result.new(result)
							end
						elsif k == 'cursor'
							pages = []
							cursor_data = { :pages => pages }
							v.each do |k, v|
								if k == 'pages'
									v.each do |page|
										pages << Result.new(page)
									end
								else
									cursor_data[k] = v
								end
							end
							@cursor = Result.new(cursor_data)
						end
					end
				else
					set_parameter(k, v)
				end
			end
	    end

	    def to_s
	    	@results.inspect
		end

	end
	
end