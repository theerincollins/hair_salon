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
  erb(:owner)
end

post('/stylists/new') do
  name = params.fetch("name")
  stylist = Stylist.new({:name => name, :id => nil})
  stylist.save()
  @stylists = Stylist.all()
  erb(:owner)
end

get('/stylists/new') do
  erb(:stylists_form)
end

get('/stylists/:id') do
  @stylist = Stylist.find(params.fetch("id").to_i)
  erb(:stylist)
end
