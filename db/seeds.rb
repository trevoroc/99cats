# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Cat.destroy_all

cat1 = Cat.create(
        name: 'Gary',
        birth_date: '2005/01/01',
        color: 'orange',
        sex: 'M',
        description: 'A loving old cat who sleeps all day'
)

cat2 = Cat.create(
        name: 'Harry',
        birth_date: '2000/03/14',
        color: 'orange',
        sex: 'M',
        description: 'Fat and neurotic'
)

cat3 = Cat.create(
        name: 'Kit',
        birth_date: '2000/02/02',
        color: 'grey',
        sex: 'F',
        description: 'A smart loud cat'
)

CatRentalRequest.destroy_all

request1 = CatRentalRequest.create(
            cat_id: cat1.id,
            start_date: "2017/04/18",
            end_date: "2017/04/28",
            status: "APPROVED"
)

request2 = CatRentalRequest.create(
            cat_id: cat1.id,
            start_date: "2017/04/23",
            end_date: "2017/05/02"
)

request3 = CatRentalRequest.create(
            cat_id: cat1.id,
            start_date: "2017/05/10",
            end_date: "2017/05/28"
)

request4 = CatRentalRequest.create(
            cat_id: cat3.id,
            start_date: "2017/04/18",
            end_date: "2017/04/28"
)
