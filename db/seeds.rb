# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

# Товары
Product.delete_all

products_list = [
    #[id, name]
    [1, '1 комната', false, 1500, 'ед.', nil, 'Уборка квартиры с 1 жилой комнатой и одной ванной.'],
    [2, '2 комнаты', false, 1800, 'ед.', nil, 'Уборка квартиры с 2 жилыми комнатами и одной ванной.'],
    [3, '3 комнаты', false, 2000, 'ед.', nil, 'Уборка квартиры с 3 жилыми комнатами и одной ванной'],
    [4, '4 комнаты', false, 2900, 'ед.', nil, 'Уборка квартиры с 4 жилыми комнатами и одной ванной'],
    [5, 'Мойка окон', true, 250, 'руб. / шт.', nil, 'Цена из расчета за стандартное окно 2 створки, целиком с двух сторон'],
    [6, 'Мытье холодильника внутри', true, 300, 'руб. / шт.', nil, 'Удаление запахов и дезинфекция'],
    [7, 'Мытье духовки/СВЧ внутри', true, 300, 'руб. / шт.', nil, 'Обезжиривание и очистка духового шкафа и/или СВЧ печи'],
    [8, 'Мытье люстры', true, 200, 'руб. / шт.', nil, 'Указывайте только те люстры, которые висят на потолке'],
    [9, 'Глажка', true, 300, 'руб. / 30 мин.', nil, 'Профессионально гладим одежду'],
    [10, 'Замена постельного белья', true, 150, 'руб. / шт.', nil, 'Поменяем комплект белья оставленный вами в указанном месте'],
    [11, 'Особые поручения', true, 700, 'руб. / час.', nil, 'Например: разложить вещи по цветам, сходить в магазин, отнести вещи в химчистку'],
    [12, 'Уборка на балконе', true, 500, 'руб. / шт.', nil, 'Мытье пола, обеспыливание поверхностей на балконе (мойка окон не входит в стоимость)']
]
products_list.each do |id, name, additional, price, unit, lead_time, description, visible_order|
  puts name
  Product.create!(id: id, name: name, additional: additional, price: price, unit: unit, lead_time: lead_time, description: description, visible_order: id - 1)
end

