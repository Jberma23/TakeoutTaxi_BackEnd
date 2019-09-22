module HeadersHelpers
    def api_authorization_header(token)
      request.headers['Authorization'] =  token
    end
 
  end