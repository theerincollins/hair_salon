require('spec_helper')

describe(Client) do

  describe('#id') do
    it("returns id of a client") do
      test_client = Client.new({:name => "Sassy Guy", :id => nil, :type_of_cut => "Buzz Cut", :stylist_id => 2})
      test_client.save()
      expect(test_client.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#name') do
    it("returns name of a client") do
      test_client = Client.new({:name => "Sassy Guy", :id => nil, :type_of_cut => "Buzz Cut", :stylist_id => 2})
      test_client.save()
      expect(test_client.name()).to(eq("Sassy Guy"))
    end
  end

  describe('#type_of_cut') do
    it("returns type of cut that a client wants") do
      test_client = Client.new({:name => "Sassy Guy", :id => nil, :type_of_cut => "Buzz Cut", :stylist_id => 2})
      test_client.save()
      expect(test_client.type_of_cut()).to(eq("Buzz Cut"))
    end
  end

  describe('#stylist_id') do
    it("returns stylist's id for a client") do
      test_client = Client.new({:name => "Sassy Guy", :id => nil, :type_of_cut => "Buzz Cut", :stylist_id => 2})
      test_client.save()
      expect(test_client.stylist_id()).to(eq(2))
    end
  end

end
