# From https://rosettacode.org/wiki/Implicit_type_conversion#C.23

# This example was originally written in C# at Rosetta Code.
# public class Person
# {
#     //Define an implicit conversion from string to Person
#     public static implicit operator Person(string name) => new Person { Name = name };
#  
#     public string Name { get; set; }
#     public override string ToString() => $"Name={Name}";
#  
#     public static void Main() {
#         Person p = "Mike";
#         Console.WriteLine(p);
#     }
# }

class Person
    def initialize(@name : String)

    end

    def to_s(io)
        io << @name
    end
end

# The approach of modifying this class is questionable, however
# with my proposition, this is how it would be done. C# handles it
# as a static method that can be overloaded anywhere.
class String
    def implicit : Person
        Person.new self
    end
end

person : Person
# ...
person = "Mike"
puts person #=> Mike