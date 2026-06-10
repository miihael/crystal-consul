require "json"

module Consul
  module Types
    module KV
      class KV
        include JSON::Serializable

        @[JSON::Field(key: "Key")]
        property key : String

        @[JSON::Field(key: "Value")]
        property value : String = ""

        @[JSON::Field(key: "Session")]
        property session : String?

        @[JSON::Field(key: "LockIndex")]
        property lock_index : Int32?
      end

      struct KvPair
        getter key, value

        def initialize(@key : String, @value : String)
        end
      end
    end

    class Session
      include JSON::Serializable

      @[JSON::Field(key: "ID")]
      property id : String

      @[JSON::Field(key: "Name")]
      property name : String?

      @[JSON::Field(key: "Node")]
      property node : String?

      @[JSON::Field(key: "Checks")]
      property checks : Array(String)?

      @[JSON::Field(key: "Behavior")]
      property behavior : String = "release"

      @[JSON::Field(key: "TTL")]
      property ttl : String?

      @[JSON::Field(key: "LockDelay")]
      property lock_delay : Float64?
    end

    module Catalog
      class Node
        include JSON::Serializable

        @[JSON::Field(key: "ID")]
        property id : String

        @[JSON::Field(key: "Node")]
        property node : String

        @[JSON::Field(key: "Address")]
        property address : String

        @[JSON::Field(key: "Datacenter")]
        property datacenter : String

        @[JSON::Field(key: "TaggedAddresses")]
        property tagged_addresses : Hash(String, String)?

        @[JSON::Field(key: "Meta")]
        property meta : Hash(String, String)?
      end

      class NodeService
        include JSON::Serializable

        @[JSON::Field(key: "ID")]
        property id : String

        @[JSON::Field(key: "Node")]
        property node : String

        @[JSON::Field(key: "Address")]
        property address : String

        @[JSON::Field(key: "Datacenter")]
        property datacenter : String

        @[JSON::Field(key: "TaggedAddresses")]
        property tagged_addresses : Hash(String, String)?

        @[JSON::Field(key: "NodeMeta")]
        property node_meta : Hash(String, String)?

        @[JSON::Field(key: "ServiceID")]
        property service_id : String

        @[JSON::Field(key: "ServiceName")]
        property service_name : String

        @[JSON::Field(key: "ServiceTags")]
        property service_tags : Array(String)?

        @[JSON::Field(key: "ServiceAddress")]
        property service_address : String

        @[JSON::Field(key: "ServiceMeta")]
        property service_meta : Hash(String, String)

        @[JSON::Field(key: "ServicePort")]
        property service_port : Int32
      end
    end

    module Agent
      class ServiceConf
        include JSON::Serializable

        @[JSON::Field(key: "Kind")]
        property kind : String?

        @[JSON::Field(key: "ID")]
        property id : String

        @[JSON::Field(key: "Service")]
        property service : String

        @[JSON::Field(key: "Tags")]
        property tags : Array(String)?

        @[JSON::Field(key: "Meta")]
        property meta : Hash(String, String)

        @[JSON::Field(key: "Address")]
        property address : String

        @[JSON::Field(key: "Port")]
        property port : Int32

        @[JSON::Field(key: "EnableTagOverride")]
        property enable_tag_override : Bool

        @[JSON::Field(key: "ContentHash")]
        property content_hash : String
      end

      class Service
        include JSON::Serializable

        @[JSON::Field(key: "ID")]
        property id : String

        @[JSON::Field(key: "Service")]
        property service : String

        @[JSON::Field(key: "Tags")]
        property tags : Array(String)

        @[JSON::Field(key: "Port")]
        property port : Int32

        @[JSON::Field(key: "Address")]
        property address : String
      end

      class Check
        include JSON::Serializable

        @[JSON::Field(key: "Node")]
        property node : String

        @[JSON::Field(key: "CheckID")]
        property check_id : String

        @[JSON::Field(key: "Name")]
        property name : String

        @[JSON::Field(key: "Status")]
        property status : String

        @[JSON::Field(key: "Output")]
        property output : String

        @[JSON::Field(key: "ServiceID")]
        property service_id : String?

        @[JSON::Field(key: "ServiceName")]
        property service_name : String?

        @[JSON::Field(key: "ServiceTags")]
        property service_tags : Array(String)?
      end

      class ServiceHealth
        include JSON::Serializable

        @[JSON::Field(key: "AggregatedStatus")]
        property aggregated_status : String

        @[JSON::Field(key: "Service")]
        property service : Service

        @[JSON::Field(key: "Checks")]
        property checks : Array(Check)
      end
    end

    module Event
      class Event
        include JSON::Serializable

        @[JSON::Field(key: "ID")]
        property id : String

        @[JSON::Field(key: "Name")]
        property name : String

        @[JSON::Field(key: "Payload")]
        property payload : String?

        @[JSON::Field(key: "NodeFilter")]
        property node_filter : String

        @[JSON::Field(key: "ServiceFilter")]
        property service_filter : String

        @[JSON::Field(key: "Version")]
        property vesion : Int32

        @[JSON::Field(key: "LTime")]
        property ltime : Int32
      end
    end

    module Health
      class Check
        include JSON::Serializable

        @[JSON::Field(key: "Node")]
        property node : String

        @[JSON::Field(key: "CheckID")]
        property check_id : String

        @[JSON::Field(key: "Name")]
        property name : String

        @[JSON::Field(key: "Status")]
        property status : String

        @[JSON::Field(key: "Notes")]
        property notes : String

        @[JSON::Field(key: "Output")]
        property output : String

        @[JSON::Field(key: "ServiceID")]
        property service_id : String

        @[JSON::Field(key: "ServiceName")]
        property service_name : String

        @[JSON::Field(key: "ServiceTags")]
        property service_tags : Array(String)
      end

      class Service
        include JSON::Serializable

        @[JSON::Field(key: "ID")]
        property id : String

        @[JSON::Field(key: "Service")]
        property service : String

        @[JSON::Field(key: "Tags")]
        property tags : Array(String)

        @[JSON::Field(key: "Address")]
        property address : String

        @[JSON::Field(key: "Port")]
        property port : Int32

        @[JSON::Field(key: "Meta")]
        property meta : Hash(String, String)
      end

      class NodeService
        include JSON::Serializable

        @[JSON::Field(key: "Node")]
        property node : Consul::Types::Catalog::Node

        @[JSON::Field(key: "Service")]
        property service : Service

        @[JSON::Field(key: "Checks")]
        property chekcs : Array(Check)
      end
    end

    module Coordinate
      class Wan
        include JSON::Serializable

        @[JSON::Field(key: "Datacenter")]
        property datacenter : String

        @[JSON::Field(key: "AreaID")]
        property area_id : String

        @[JSON::Field(key: "Coordinates")]
        property coordinates : Array(Coordinates)
      end

      class Lan
        include JSON::Serializable

        @[JSON::Field(key: "Node")]
        property node : String

        @[JSON::Field(key: "Segment")]
        property segment : String

        @[JSON::Field(key: "Coord")]
        property coord : Coord
      end

      class Coord
        include JSON::Serializable

        @[JSON::Field(key: "Adjustment")]
        property adjustment : Int32

        @[JSON::Field(key: "Error")]
        property error : Float64

        @[JSON::Field(key: "Height")]
        property height : Float64

        @[JSON::Field(key: "Vec")]
        property vec : Array(Int32)
      end

      class Coordinates
        include JSON::Serializable

        @[JSON::Field(key: "Node")]
        property node : String

        @[JSON::Field(key: "Segment")]
        property segment : String?

        @[JSON::Field(key: "Coord")]
        property coord : Coord
      end
    end
  end
end
