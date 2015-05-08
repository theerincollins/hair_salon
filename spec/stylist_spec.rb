require('spec_helper')

describe (Stylist) do
  describe('.all') do
    it("returns all stylists in the database") do
      test_stylist = Stylist.new({:name => "Sally Sanderson", :id => nil})
      test_stylist.save()
      expect(Stylist.all()).to(eq([test_stylist]))
    end
  end

  describe('#==') do
    it("is equal if two stylists have the same name") do
      test_stylist = Stylist.new({:name => "Sally Sanderson", :id => nil})
      test_stylist.save()
      test_stylist2 = Stylist.new({:name => "Sally Sanderson", :id => nil})
      test_stylist2.save()
      expect(test_stylist).to(eq(test_stylist2))
    end
  end

  describe('#id') do
    it("returns id of a stylist") do
      test_stylist = Stylist.new({:name => "Girl Guy", :id => nil})
      test_stylist.save()
      expect(test_stylist.id()).to(be_an_instance_of(Fixnum))
    end
  end

  describe('#name') do
    it("returns name of a stylist") do
      test_stylist = Stylist.new({:name => "Girl Guy", :id => nil})
      test_stylist.save()
      expect(test_stylist.name()).to(eq("Girl Guy"))
    end
  end

  describe('.find') do
    it("returns a stylist using stylist's id") do
      test_stylist = Stylist.new({:name => "Girl Guy", :id => nil})
      test_stylist.save()
      expect(Stylist.find(test_stylist.id)).to(eq(test_stylist))
    end
  end

  describe('#update') do
    it("updates a stylist's name on the database") do
      test_stylist = Stylist.new({:name => "Girl Guy", :id => nil})
      test_stylist.save()
      test_stylist.update({:name => "Fancy Pants"})
      expect(test_stylist.name()).to(eq("Fancy Pants"))
    end
  end

  describe('#delete') do
    it("allows user to delete a stylist from the database") do
      test_stylist = Stylist.new({:name => "Girl Guy", :id => nil})
      test_stylist.save()
      test_stylist.delete()
      expect(Stylist.all()).to(eq([]))
    end
  end

end
