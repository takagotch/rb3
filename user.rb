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

class User < ActiveRecord::Base
  def before_create
    self.encrypted_password = encrypt(self.password)
  end

  private
  def encrypt(password)
  end
end


class User < ActiveRecord::Base
  before_create :encrypt_password
  private
  def encrypt_password
    self.encrypted_password = encrypt(self.password)
  end

  def encrypt(password)
  end
end


class User < ActiveRecord::Base
  before_create "self.encrypted_password = encrypt(self.password)"

  private
  def encrypt(password)
  end
end


class User < ActiveRecord::Base
  before_create do |record|
    record.encrypted_password = encrypt(record.password)
  end

  private
  def encrypt(password)
  end
end

class User < ActiveRecord::Base
  before_create PasswordEncryptor.new("password")
end

class PasswordEncryptor
  def initialize(attr)
    @attr_for_callback = attr
  end

  def before_create(record)
    record.encrypted_password =
    encrypt(record.send(@attr_for_callback))
  end

  private
  def encrypt(password)
  end
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



