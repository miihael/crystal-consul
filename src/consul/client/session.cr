require "../types/*"
require "../transport"
require "../util"

module Consul
  class Session < Consul::Transport
    def list() : Array(Consul::Types::Session)
      consistency = get_consistency()
      resp = get("/v1/session/list?#{consistency}")
      return Array(Consul::Types::Session).from_json(resp.body)
    end

    def info(uuid : String) : Consul::Types::Session?
      consistency = get_consistency()
      resp = get("/v1/session/info/#{uuid}?#{consistency}")
      ss = Array(Consul::Types::Session).from_json(resp.body)
      return ss.size > 0 ? ss[0] : nil
    end

    def create(
      name : String,
      node : String? = nil,
      lock_delay : Float64? = nil,
      ttl : String? = nil,
      checks : Array(String)? = nil,
      behavior : String? = nil,
      datacenter : String? = nil,
    ) : Consul::Types::Session
      data = Consul::Util.build_hash({
        "Node"       => node,
        "Name"       => name,
        "LockDelay"  => lock_delay,
        "TTL"        => ttl,
        "Checks"     => checks,
        "Behavior"   => behavior,
        "Datacenter" => datacenter,
      })
      resp = put("/v1/session/create", data.to_json)
      #returns only ID
      s = Consul::Types::Session.from_json(resp.body)
      s.node = node
      s.name = name
      s.lock_delay = lock_delay
      s.ttl = ttl
      s.checks = checks
      return s
    end

    # destroy deletes a session
    def destroy(uuid : String)
      put("/v1/session/destroy/#{uuid}")
    end

    # renew session by its TTL
    def renew(uuid : String) : Consul::Types::Session?
      resp = put("/v1/session/renew/#{uuid}")
      ss = Array(Consul::Types::Session).from_json(resp.body)
      return ss.size > 0 ? ss[0] : nil
    end
  end
end
