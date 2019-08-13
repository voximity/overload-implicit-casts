class MonetaryValue
    getter whole : Int32
    getter cents : Float32

    setter whole
    setter cents

    def initialize(@whole, @cents)

    end

    def implicit : Float32
        whole + cents
    end
end

struct Float32
    def implicit : MonetaryValue
        whole = to_i32
        MonetaryValue.new whole, self - whole
    end
end

money : MonetaryValue
money = MonetaryValue.new 59, .99
puts money #=> 59.99

money = 27.99
puts money #=> 27.99
puts money.whole #=> 27