# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

Type.destroy_all
Category.destroy_all
Bookmark.destroy_all

type = ['Documento', 'Video', 'Infografia', 'Diagrama', 'Entrevista', 'Reporte']

category = ['Ciencia', 'Literatura', 'Hobbies']
subcategories = [['Fisica', 'Quimica', 'Biologia'], ['Ciencia Ficción', 'Fantasia', 'Novela'], 
                  ['Pintura', 'Tejidos', 'Maquetas']]

type.each do |t|
  ty = Type.create(name: t)
  puts "Se ha creado el tipo: #{ty.name}"
end

category.each do |c|
  ca = Category.create(name: c)
  puts "Se ha creado la categoria: #{ca.name}"
end

3.times do |i|
  subcategories[i].each do |s|
    su = Category.create(name: s, parent_category: i+1)
    puts "Se ha creado la subcategoria: #{su.name}"
  end
end

20.times do |i|
  bookmark = Bookmark.create(name: Faker::Superhero.name ,
                        url: Faker::Internet.url,
                        category_id: rand(1..12),
                        type_id: rand(1..6))
  puts "Se ha creado el marcador: #{bookmark.name}"
end