require('pry-byebug')
require_relative('../goodfood/')

Bounty.delete_all

donut1 = Donut.new( { 'brand' => 'Krispy Kreme', 'name' => 'Raspberry Delight', 'dairy_free' => FALSE, 'calories' => 10000 } )
donut2 = Donut.new( { 'brand' => 'Greggs', 'name' => 'Plain Donut', 'dairy_free' => TRUE, 'calories' => 1} )

donut1.save()
donut2.save()

binding.pry

nil