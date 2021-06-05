require "./spec_helper"

describe Consul do
  context ".Session" do
    it "should create/list/destroy sessions" do
      c = Consul.client
      s = c.session.create("test1")
      uuid = s.id

      ss = c.session.list()
      ss.size.should eq 1

      ss = c.session.info(uuid)
      ss.should_not be_nil
      p ss
      ss.try { |s| s.name.try { |x| x.should eq "test1" }}

      c.session.destroy(uuid)
      ss = c.session.list()
      ss.size.should eq 0
    end
  end
end
