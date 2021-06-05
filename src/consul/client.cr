require "./client/*"
require "./agent/*"
require "json"
require "http/client"
require "uri"

module Consul
  class Client
    getter host, port, scheme, token, consistency
    getter kv, catalog, status, agent, event, health, coordinate, session
    getter snapshot

    def initialize(
      @host : String = "127.0.0.1",
      @port : Int32 = 8500,
      @scheme : String = "http",
      @token : String = "",
      @consistency : String = "default", # to be implemented
      @timeout : Number = 5.0,
    )
      if consistency === "default" || consistency === "consistent" || consistency === "stale"
      else
        raise "Error: #{consistency} is not a valid consistency option"
      end

      client = http_client_instance("#{scheme}://#{host}:#{port}", @timeout, token)

      @kv = Consul::KV.new(client, consistency)
      @catalog = Consul::Catalog.new(client, consistency)
      @status = Consul::Status.new(client, consistency)
      @agent = Consul::Agent.new(client, consistency)
      @event = Consul::Event.new(client, consistency)
      @health = Consul::Health.new(client, consistency)
      @coordinate = Consul::Coordinate.new(client, consistency)
      @snapshot = Consul::Snapshot.new(client, consistency)
      @session = Consul::Session.new(client, consistency)
    end

    private def http_client_instance(uri : String, timeout : Number,  token : String? = nil) : HTTP::Client
      uri = URI.parse(uri)
      client = HTTP::Client.new(uri)
      client.connect_timeout = timeout

      unless token == ""
        client.before_request do |request|
          request.headers["X-Consul-Token"] = token
        end
      end

      return client
    end
  end
end
