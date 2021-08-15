class ServeRest
  include Excon
  attr_accessor :base_uri

  def initialize
    self.base_uri = $base_uri
  end

  def get(endpoint, body = nil)
    Excon.get(base_uri + endpoint)
  end

  def post(endpoint, body)
    Excon.post(base_uri + endpoint,
      :headers => { 'Content-Type' => 'application/json' },
      :body => body.to_json
    )
  end

  def delete(endpoint, body = nil)
    Excon.delete(base_uri + endpoint)
  end

  def put(endpoint, body)
    Excon.put(base_uri + endpoint,
      :headers => { 'Content-Type' => 'application/json' },
      :body => body.to_json
    )
  end
end
