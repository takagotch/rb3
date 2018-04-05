class User < ActiveRecord::Base
  composed_of :address,
	  :mapping=>[["address_zip", "zip"],
    ["address_prefecture", "prefecture"],
    ["address_city", "city"]]
end


class User < ActiveRecord::Base
  composed_of :residence, :class_name => "Address"
    :mappint=>[["address_zip", "zip"],
    ["address_prefecture", "prefecture"],
    ["address_city", "city"]]
end

class User < ActiveRecord::Base
  composed_of :address, :allow_nil => true,
    :mapping=>[["address_zip", "zip"],
    ["address_prefecture", "prefecture"],
    ["address_city", "city"]]
end

/*
	tky = User.find(10)	
	tky.address.zip
	tky.addresss.prefecture
	tky.address.city

	tky.address = nil

	tky.address_zip
	tky.address_prefecture
	tky.address_city

*/



