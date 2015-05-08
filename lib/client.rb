class Client
  attr_reader(:name, :stylist_id, :type_of_cut, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @type_of_cut = attributes.fetch(:type_of_cut)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  define_singleton_method(:all) do
    all_clients = []
    returned_clients = DB.exec("SELECT * FROM clients;")
    returned_clients.each do |client|
      name = client.fetch("name")
      id = client.fetch("id").to_i
      stylist_id = client.fetch("stylist_id").to_i
      type_of_cut = client.fetch("type_of_cut")
      all_clients.push(Client.new({:name => name, :id => id, :stylist_id => stylist_id, :type_of_cut => type_of_cut}))
    end
  all_clients
  end

  define_method(:save) do
    result = DB.exec("INSERT INTO clients (name, stylist_id, type_of_cut) VALUES ('#{@name}', #{@stylist_id}, '#{@type_of_cut}') RETURNING ID;")
    @id = result.first().fetch("id").to_i
  end

  define_singleton_method(:find) do |id|
    client = DB.exec("SELECT * FROM clients WHERE id = #{id}")
    name = client.first().fetch("name")
    stylist_id = client.first().fetch("stylist_id").to_i
    type_of_cut = client.first().fetch("type_of_cut")
    found_client = Client.new({:name => name, :stylist_id => stylist_id, :type_of_cut => type_of_cut, :id => id})
  end

  define_method(:==) do |other_client|
    self.name == other_client.name() && self.type_of_cut() == other_client.type_of_cut() && self.stylist_id() == other_client.stylist_id()
  end

  define_method(:delete) do
    DB.exec("DELETE FROM clients WHERE id = #{self.id()};")
  end

  define_method(:update) do |attributes|
    if attributes.fetch(:name) == ""
      @name = @name
    else
      @name = attributes.fetch(:name)
    end

    if attributes.fetch(:stylist_id) == @stylist_id
      @stylist_id = @stylist_id
    else
      @stylist_id = attributes.fetch(:stylist_id)
    end

    if attributes.fetch(:type_of_cut) == ""
      @type_of_cut = @type_of_cut
    else
      @type_of_cut = attributes.fetch(:type_of_cut)
    end

    @id = self.id()

    DB.exec("UPDATE clients SET name = '#{@name}' WHERE id = #{@id};")
    DB.exec("UPDATE clients SET type_of_cut = '#{@type_of_cut}' WHERE id = #{@id};")
    DB.exec("UPDATE clients SET stylist_id = #{@stylist_id} WHERE id = #{@id};")
  end

end
