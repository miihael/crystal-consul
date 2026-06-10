require "json"

module Consul
  class Check
    include JSON::Serializable

    @[JSON::Field(key: "Name")]
    property name : String

    @[JSON::Field(key: "ID")]
    property id : String?

    @[JSON::Field(key: "Interval")]
    property interval : String?

    @[JSON::Field(key: "Notes")]
    property notes : String?

    @[JSON::Field(key: "DeregisterCriticalServiceAfter")]
    property deregister_critial_service_after : String?

    @[JSON::Field(key: "Args")]
    property args : Array(String)?

    @[JSON::Field(key: "AliasNode")]
    property alias_node : String?

    @[JSON::Field(key: "AliasSerice")]
    property alias_service : String?

    @[JSON::Field(key: "DockerContainerID")]
    property docker_container_id : String?

    @[JSON::Field(key: "GRPC")]
    property grpc : String?

    @[JSON::Field(key: "GRPCUseTLS")]
    property grpc_use_tls : Bool?

    @[JSON::Field(key: "HTTP")]
    property http : String?

    @[JSON::Field(key: "Method")]
    property method : String?

    @[JSON::Field(key: "Header")]
    property header : Hash(String, Array(String))?

    @[JSON::Field(key: "Timeout")]
    property timeout : String?

    @[JSON::Field(key: "TLSSkipVerify")]
    property tls_skip_verify : Bool?

    @[JSON::Field(key: "TCP")]
    property tcp : String?

    @[JSON::Field(key: "TTL")]
    property ttl : String?

    @[JSON::Field(key: "ServiceID")]
    property service_id : String?

    @[JSON::Field(key: "Status")]
    property status : String?

    def initialize(
      @name : String = "",
      @id : String? = nil,
      @interval : String? = nil,
      @notes : String? = nil,
      @deregister_critial_service_after : String? = nil,
      @args : Array(String)? = nil,
      @alias_node : String? = nil,
      @alias_service : String? = nil,
      @docker_container_id : String? = nil,
      @grpc : String? = nil,
      @grpc_use_tls : Bool = false,
      @http : String? = nil,
      @method : String? = nil,
      @header : Hash(String, Array(String))? = nil,
      @timeout : String = "10s",
      @tls_skip_verify : Bool = false,
      @tcp : String? = nil,
      @ttl : String? = nil,
      @service_id : String? = nil,
      @status : String? = nil,
    )
    end
  end
end
