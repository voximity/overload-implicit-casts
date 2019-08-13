# In this example, the context of some rendering library is used.
# It defines two types of completely separate points, assumably being bound
# from a C binding. Their primary difference is the type that their values are in.
# PointI stores its values as Int32, while Point stores its values as Float64.
# Two top-level methods exist that only accept a PointI and a Point, respectively.
# Using the power of overloadable implicit type casts, both points are able to explain
# to the compiler what should happen if one of the types is used in what would be
# "the wrong place."

# This is one of the lead reasons I would like this functionality is specifically
# for this example of being able to use both types interchangeably.

class PointI
    def initialize(@x : Int32, @y : Int32)

    end

    def implicit : Point
        Point.new @x.to_f64, @y.to_f64
    end
end

class Point
    def initialize(@x : Float64, @y : Float64)
    end

    def implicit : PointI
        PointI.new @x.to_i32, @y.to_i32
    end
end

# somewhere later...

def create_image(size : PointI, ...)
    ...
end

def draw_object(point : Point, ...)
    ...
end

# user's code...

create_image PointI.new(1920, 1080), ... # works as expected, passing PointI to a method that accepts it
draw_object Point.new(20, 20), ... # works as expected

create_image Point.new(20.5, 20.5), ... # internally invokes `Point#implicit` to handle the conversion,
# Point#implicit returns PointI.new 20_i32, 20_i32
draw_object PointI.new(20, 20), ... # internally invokes `PointI#implicit` to handle the conversion,
# `PointI#implicit` returns Point.new 20_f64, 20_f64