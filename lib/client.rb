class Client
  attr_reader(:name, :stylist_id, :type_of_cut, :id)

  define_method(:initialize) do |attributes|
    @name = attributes.fetch(:name)
    @id = attributes.fetch(:id)
    @type_of_cut = attributes.fetch(:type_of_cut)
    @stylist_id = attributes.fetch(:stylist_id)
  end

  

end
