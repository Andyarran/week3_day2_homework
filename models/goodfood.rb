require 'pg'

class Donut

  attr_reader :id
  attr_accessor :brand, :name, :dairy_free, :calories

  def initialize(options)
    @brand = options['brand']
    @name = options['name']
    @dairy_free = options['dairy_free']
    @calories = options['calories']
    @id = options['id'].to_i if options['id']
  end

  def save()
    db = PG.connect( { dbname: 'donuts', host: 'localhost' } )
    sql = "INSERT INTO donuts
      (brand, name, dairy_free, calories)
      VALUES 
      ('#{brand}', '#{name}', #{dairy_free}, #{calories}) 
      RETURNING id;"
    @id = db.exec(sql)[0]['id'].to_i
    db.close
  end

  def update()
    db = PG.connect( { dbname: 'donuts', host: 'localhost' } )
    sql = "UPDATE donuts SET
      (brand, name, dairy_free, calories) =
      ('#{brand}', '#{name}', #{dairy_free}, #{calories}) 
      WHERE id = #{@id};"
    @id = db.exec(sql)
    db.close
  end

  def delete()
    db = PG.connect( { dbname: 'donuts', host: 'localhost' } )
    sql = "DELETE FROM donuts WHERE id = #{@id}"
    @id = db.exec(sql)
    db.close
  end

  def self.delete_all()
    db = PG.connect( { dbname: 'donuts', host: 'localhost' } )
    sql = "DELETE FROM donuts"
    db.exec(sql)
    db.close
  end

  def self.find(id)
    db = PG.connect( {dbname: 'donuts', host: 'localhost' } )
    sql = "SELECT * FROM donuts WHERE id = #{id}"
    result = db.exec(sql)
    db.close
    return Donut.new(result[0])
  end














end