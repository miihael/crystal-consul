require "json"

module Consul
  class Service
    include JSON::Serializable

    @[JSON::Field(key: "ID")]
    property id : String?

    @[JSON::Field(key: "Name")]
    property name : String?

    @[JSON::Field(key: "Address")]
    property address : String?

    @[JSON::Field(key: "Tags")]
    property tags : Array(String)?

    @[JSON::Field(key: "Port")]
    property port : Int32

    @[JSON::Field(key: "EnableTagOverride")]
    property tag_override : Bool

    @[JSON::Field(key: "Meta")]
    property meta : Hash(String, String)?

    @[JSON::Field(key: "Check")]
    property check : Hash(String, String)?

    def initialize(
      @id : String? = nil,
      @name : String = "",
      @address : String? = nil,
      @tags = [] of String,
      @port : Int32 = 0,
      @tag_override : Bool = false,
      @meta = {} of String => String,
      @check = {} of String => String,
    )
    end
  end
end
