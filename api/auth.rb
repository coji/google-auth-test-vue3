
require 'uri'
require 'net/http'

# vercel serverless functions
# https://vercel.com/docs/functions/serverless-functions/runtimes/ruby

Handler = Proc.new do |request, response|
  id_token = request.query['id_token']
  begin
    response.body = verify_google_id_token(id_token)
    response.status = 200
    response['Content-Type'] = 'application/json; charset=utf-8'  
  rescue => e
    response.body = e.to_s
    response.status = 401
    response['Content-Type'] = 'text/plain; charset=utf-8'
  end
end

# google id token の検証
def verify_google_id_token(id_token)
  uri = URI("https://oauth2.googleapis.com/tokeninfo?id_token=#{id_token}")
  res = Net::HTTP.get_response(uri)
  if res.is_a?(Net::HTTPSuccess)
    return res.body if res.is_a?(Net::HTTPSuccess)
  else
    raise StandardError.new("google id token verify error: #{res.to_s}")
  end
end
