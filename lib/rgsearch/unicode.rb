module RGSearch
  
  class Unicode
  
    def self.escape(str)
      ary = str.unpack("U*").map!{|i| "\\u#{i.to_s(16)}"}
      ary.join
    end
  
    UNESCAPE_ARRAY = []
    def self.unescape(str)
      str.gsub(/\\u([0-9a-f]{4})/) {
        UNESCAPE_ARRAY[0] = $1.hex
        UNESCAPE_ARRAY.pack("U")
      }
    end
  
  end
  
end
