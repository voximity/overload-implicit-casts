# overload-implicit-casts

This repo is full of a few use cases for overloadable implicit type casts for Crystal,
a proposition I made [here](https://forum.crystal-lang.org/t/overloadable-implicit-type-casts/1046).

## Things to note

### The syntax

I consistently use the same syntax for defining implicit cast methods, which is as follows:
```cr
def implicit : B
    A...
end
```
where B is the resulting type and A is the transforming type.

I am not sure I am a complete fan of this syntax. It seems to work for what I'm doing, but there's still
always the slightest chance the user wants to define an actual method named implicit.

### Similar to `to_<T>`

Because `to_<T>` is explicit, this implementation would allow users to omit that call entirely
and allow the compiler to call a similar method implicitly, allowing for greater readability
and consistency throughout code.

### Fewer overloaded methods

In `varying_point_types.cr`, I give an example of two top-level methods. Right now, without overloadable
implicit type casts, you are required to create overloads for each of these methods with each type you
wish to accept as a parameter, effectively *doubling* the number of methods you wish to increase compatibility
for, only if you want to implicitly allow another type to be passed. For example, I would have to manually
overload the two methods an extra time for each to allow the other point types to be accepted into the method,
just to be converted.