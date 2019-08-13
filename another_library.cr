# Perhaps another module `SomeModule`...

module SomeModule
    # defines a type `SomeClass`...
    class SomeClass

    end

    # but also defines a method `some_method`...
    def some_method(some : SomeClass)
        some.do_something
    end

    # maybe another method `another_method` that looks similar...
    def another_method(some : SomeClass)
        some.do_something_else
    end
end

# In my application, I use SomeModule, but I have my own class...
class CompletelyUnrelatedClassThatIsSlightlyRelated

end

some_method CompletelyUnrelatedClassThatIsSlightlyRelated.new # this throws a compile-time error!

# I want to pass it to `some_method`. How might I do that? Create a PR on SomeModule???
# Overload `some_method` AND `another_method` by modifying SomeModule so it has an overload that accepts a CompletelyUnrelatedClassThatIsSlightlyRelated???

# Overloadable implicit type casts!

class CompletelyUnrelatedClassThatIsSlightlyRelated
    def implicit : SomeModule::SomeClass
        somehow_derive_some_class
    end
end

some_method CompletelyUnrelatedClassThatIsSlightlyRelated.new # this works! the compiler calls the class's `implicit` method.