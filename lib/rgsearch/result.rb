module RGSearch

	class Result
		
		def initialize(data)			
			if data.kind_of?(Hash)
				data.each do |key, value|
					set_att(key, make_result(value))
				end
			end
		end

		private
		def make_result(value)
			if value.kind_of?(String) or value.kind_of?(Numeric) \
          or value.kind_of?(TrueClass) or value.kind_of?(FalseClass)
				value
			elsif value.kind_of?(Hash)
				Result.new(value)
			elsif value.kind_of?(Array)
				value.collect {|v| make_result(v)}
			end
		end

		def set_att(key, value)
			key = to_att(key)
			instance_variable_set("@#{key}", value) 
			instance_eval("def #{key}; @#{key}; end")
		end

		def to_att(att)
			i = 0
			word = []			
			att.each_char do |c|
				i = i + 1 if c =~ /[A-Z]/
				word[i] = "" if word[i].nil?
				word[i] << c.downcase
			end			
			word.compact.join("_")
		end

	end

end
