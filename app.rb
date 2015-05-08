require('./lib/client')
require('./lib/stylist')
require('sinatra')
require('sinatra/reloader')
also_reload('lib/**/*.rb')
require('pry')
require('pg')

DB = PG.connect({:dbname => "hair_salon"})

get('/') do
  erb(:index)
end

get('/owner') do
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:owner)
end

post('/stylists/new') do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  @clients = Client.all()
  erb(:owner)
end

get('/stylists/new') do
  erb(:stylists_form)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i)
  @clients = Client.all()
  erb(:stylist)
end

get('/clients/new') do
  @stylists = Stylist.all()
  erb(:client_form)
end

post('/clients/new') do
  @stylists = Stylist.all()
  name = params.fetch("name")
  type_of_cut = params.fetch("type_of_cut")
  stylist_id = params.fetch("stylist").to_i
  new_client = Client.new({:name => name, :type_of_cut => type_of_cut, :stylist_id => stylist_id, :id => nil})
  new_client.save()
  @clients = Client.all()
  erb(:owner)
end

get('/clients/:id') do
  @stylists = Stylist.all()
  @client = Client.find(params.fetch("id").to_i)
  stylist_id = @client.stylist_id()
  @stylist_name = Stylist.find(stylist_id).name()
  erb(:client)
end

patch('/clients/:id') do
  @client = Client.find(params.fetch("id").to_i())
  @client.update({:name => params.fetch("name"), :stylist_id => params.fetch("stylist").to_i, :type_of_cut => params.fetch("type_of_cut")})
  stylist_id = @client.stylist_id()
  @stylist_name = Stylist.find(stylist_id).name()
  @stylists = Stylist.all()
  erb(:client)
end

delete('/client') do
  client = Client.find(params.fetch("id").to_i)
  client.delete()
  @clients = Client.all
  @stylists = Stylist.all
  erb(:owner)
end

delete('/stylist') do
  stylist = Stylist.find(params.fetch("id").to_i)
  stylist.delete()
  @clients = Client.all
  @stylists = Stylist.all
  erb(:owner)
end
