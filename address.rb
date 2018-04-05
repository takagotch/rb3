class Address 
  attr_accessor :zip, :prefecture, :city

  def initialize(zip, prefecture, city)
    @zip, @prefecture, @city = zip, prefecture, city
  end
end

Address = Struct.new(:zip, :prefecture, :city)

tky = User.new(:name=>"tky", "email=>"tky@ex.com")
an_address = Address.new("111-1111", "Osaka", "Kitaku - Ofukatyo")

tky.address = an_address
tky.address_zip
tky.address_prefecture
tky.address_city

tky.save
saved_address = tky.reload.address

saved_address.prefecture



