module RGSearch

  class Search

    def self.web(query, params = {})
      find "web", query, params
    end

    def self.images(query, params = {})
      find "images", query, params
    end

    def self.news(query, params = {})
      find "news", query, params
    end

    def self.blogs(query, params = {})
      find "blogs", query, params
    end

    def self.videos(query, params = {})
      find "video", query, params
    end

    def self.books(query, params = {})
      find "books", query, params
    end
    
    def self.local(query, params = {})
      find "local", query, params
    end

    private
    def self.find(engine, query, params)
      url = URI.encode "#{API_URL}/#{engine}"
      validate params, query
      data = Request.get(url, params, {})
      Result.new ActiveSupport::JSON.decode(data)
    end
    
    def self.validate(params, query)
      raise RGSearchException, "key is not specified" unless RGSearch.key
      raise RGSearchException, "start is invalid" if params[:start] and params[:start] < 0
      unless ["small", "large"].include? params[:rsz] || "small"
        raise RGSearchException, "result size is invalid"
      end
      params[:q] = query
      params[:v] = API_VERSION
      params[:key] = RGSearch.key
    end

  end

end
