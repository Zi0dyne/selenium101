class Vehicle

   attr_accessor :engineType
   attr_accessor :wheels

   def initialize(des = 'TBD')
     puts __FILE__ + (__LINE__).to_s +  "  [Vehicle]: initialize"

     # Place any initialization code here 
     @description = des
     @wheels = 0
     @totalPassengers = 0
   end

   def dump()
     puts __FILE__ + (__LINE__).to_s + "  [Vehicle]:dump"
     puts "o Description: " + @description
     puts "o Wheels    : " +  @wheels.to_s
     puts "o Passengers : " + @totalPassengers.to_s
  end

end
