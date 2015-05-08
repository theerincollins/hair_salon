class Stylist

  attr_reader(:name, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
  end

  define_singleton_method(:all) do
    all_stylists = []
    results = DB.exec("SELECT * FROM stylists")
    results.each do |stylist|
      name = stylist.fetch("name")
      id = stylist.fetch("id").to_i
      all_stylists.push(Stylist.new({:name => name, :id => id}))
    end
    all_stylists
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO stylists (name) VALUES ('#{@name}') RETURNING id;")
    @id = result.first().fetch("id").to_i
  end

  define_method(:==) do |other_stylist|
    self.name == other_stylist.name()
  end

  define_singleton_method(:find) do |id|
    found_stylist = DB.exec("SELECT * FROM stylists WHERE id = '#{id}';")
    name = found_stylist.first().fetch("name")
    Stylist.new({:name => name, :id => id})
  end

  define_method(:update) do |attributes|
    if attributes.fetch(:name) == ""
      @name = @name
    else
      @name = attributes.fetch(:name)
    end

    @id = self.id()
    DB.exec("UPDATE stylists SET name = '#{@name}' WHERE id = #{@id};")
  end

  define_method(:delete) do
    DB.exec("DELETE FROM stylists WHERE id = #{self.id()};")
  end

  define_method(:clients) do
    all_clients = []
    returned_clients = DB.exec("SELECT * FROM clients WHERE stylist_id = #{self.id()};")
    returned_clients.each do |client|
      name = client.fetch("name")
      stylist_id = client.fetch("stylist_id").to_i
      type_of_cut = client.fetch("type_of_cut")
      id = client.fetch("id").to_i
      all_clients.push(Client.new({:name => name, :stylist_id => stylist_id, :type_of_cut => type_of_cut, :id => id}))
    end
    all_clients
  end

end
