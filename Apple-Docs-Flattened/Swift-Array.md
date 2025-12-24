Source: https://developer.apple.com/documentation/Swift/Array

[ Skip Navigation ](https://developer.apple.com/documentation/Swift/Array#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/Swift/Array#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/Swift/Array)
  * [Apple Developer](https://developer.apple.com/)


[ Search Developer Cancel  ](https://developer.apple.com/search/)
  * [Apple Developer](https://developer.apple.com/)
  * [News](https://developer.apple.com/news/)
  * [Discover](https://developer.apple.com/discover/)
  * [Design](https://developer.apple.com/design/)
  * [Develop](https://developer.apple.com/develop/)
  * [Distribute](https://developer.apple.com/distribute/)
  * [Support](https://developer.apple.com/support/)
  * [Account](https://developer.apple.com/account/)
  * [](https://developer.apple.com/search/)


Cancel 
Only search within “Documentation”
### Quick Links
  * [Downloads](https://developer.apple.com/download/)
  * [Documentation](https://developer.apple.com/documentation/)
  * [Sample Code](https://developer.apple.com/documentation/samplecode/)
  * [Videos](https://developer.apple.com/videos/)
  * [Forums](https://developer.apple.com/forums/)

5 Quick Links
[ Documentation ](https://developer.apple.com/documentation)
[ Open Menu ](https://developer.apple.com/documentation/Swift/Array)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/Swift/Array)
## [ Swift  ](https://developer.apple.com/documentation/swift)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 36 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 36 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 36 symbols inside <root> [Swift updates](https://developer.apple.com/documentation/updates/swift)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 36 symbols inside <root> [Adopting strict concurrency in Swift 6 apps](https://developer.apple.com/documentation/swift/adoptingswift6)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 36 symbols inside <root>
Standard Library
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
5 of 36 symbols inside <root> containing 128 symbols[Int](https://developer.apple.com/documentation/swift/int)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
6 of 36 symbols inside <root> containing 163 symbols[Double](https://developer.apple.com/documentation/swift/double)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
7 of 36 symbols inside <root> containing 340 symbols[String](https://developer.apple.com/documentation/swift/string)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
8 of 36 symbols inside <root> containing 197 symbols[Array](https://developer.apple.com/documentation/swift/array)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 197 symbols inside -659953939 
Creating an Array
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 197 symbols inside -659953939 [init()](https://developer.apple.com/documentation/swift/array/init\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 197 symbols inside -659953939 [init<S>(S)](https://developer.apple.com/documentation/swift/array/init\(_:\)-1ip9h)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 197 symbols inside -659953939 [init<S>(S)](https://developer.apple.com/documentation/swift/array/init\(_:\)-236cl)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 197 symbols inside -659953939 [init(repeating: Element, count: Int)](https://developer.apple.com/documentation/swift/array/init\(repeating:count:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
6 of 197 symbols inside -659953939 [init(unsafeUninitializedCapacity: Int, initializingWith: (inout UnsafeMutableBufferPointer<Element>, inout Int) throws -> Void) rethrows](https://developer.apple.com/documentation/swift/array/init\(unsafeuninitializedcapacity:initializingwith:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 197 symbols inside -659953939 
Inspecting an Array
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
8 of 197 symbols inside -659953939 [var isEmpty: Bool](https://developer.apple.com/documentation/swift/array/isempty)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
9 of 197 symbols inside -659953939 [var count: Int](https://developer.apple.com/documentation/swift/array/count)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
10 of 197 symbols inside -659953939 [var capacity: Int](https://developer.apple.com/documentation/swift/array/capacity)
233 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Swift ](https://developer.apple.com/documentation/swift)
  * [ Array ](https://developer.apple.com/documentation/Swift/Array)
  *     * Array 


Structure
# Array
An ordered, random-access collection.
iOS 8.0+iPadOS 8.0+Mac Catalyst 13.0+macOS 10.10+tvOS 9.0+visionOS 1.0+watchOS 2.0+
```
@frozen
struct Array<Element>
```

## [Overview](https://developer.apple.com/documentation/Swift/Array#overview)
Arrays are one of the most commonly used data types in an app. You use arrays to organize your app’s data. Specifically, you use the `Array` type to hold elements of a single type, the array’s `Element` type. An array can store any kind of elements—from integers to strings to classes.
Swift makes it easy to create arrays in your code using an array literal: simply surround a comma-separated list of values with square brackets. Without any other information, Swift creates an array that includes the specified values, automatically inferring the array’s `Element` type. For example:
```
// An array of 'Int' elements
let oddNumbers = [1, 3, 5, 7, 9, 11, 13, 15]


// An array of 'String' elements
let streets = ["Albemarle", "Brandywine", "Chesapeake"]

```

You can create an empty array by specifying the `Element` type of your array in the declaration. For example:
```
// Shortened forms are preferred
var emptyDoubles: [Double] = []


// The full type name is also allowed
var emptyFloats: Array<Float> = Array()

```

If you need an array that is preinitialized with a fixed number of default values, use the `Array(repeating:count:)` initializer.
```
var digitCounts = Array(repeating: 0, count: 10)
print(digitCounts)
// Prints "[0, 0, 0, 0, 0, 0, 0, 0, 0, 0]"

```

# [Accessing Array Values](https://developer.apple.com/documentation/Swift/Array#Accessing-Array-Values)
When you need to perform an operation on all of an array’s elements, use a `for`-`in` loop to iterate through the array’s contents.
```
for street in streets {
    print("I don't live on \(street).")
}
// Prints "I don't live on Albemarle."
// Prints "I don't live on Brandywine."
// Prints "I don't live on Chesapeake."

```

Use the `isEmpty` property to check quickly whether an array has any elements, or use the `count` property to find the number of elements in the array.
```
if oddNumbers.isEmpty {
    print("I don't know any odd numbers.")
} else {
    print("I know \(oddNumbers.count) odd numbers.")
}
// Prints "I know 8 odd numbers."

```

Use the `first` and `last` properties for safe access to the value of the array’s first and last elements. If the array is empty, these properties are `nil`.
```
if let firstElement = oddNumbers.first, let lastElement = oddNumbers.last {
    print(firstElement, lastElement, separator: ", ")
}
// Prints "1, 15"


print(emptyDoubles.first, emptyDoubles.last, separator: ", ")
// Prints "nil, nil"

```

You can access individual array elements through a subscript. The first element of a nonempty array is always at index zero. You can subscript an array with any integer from zero up to, but not including, the count of the array. Using a negative number or an index equal to or greater than `count` triggers a runtime error. For example:
```
print(oddNumbers[0], oddNumbers[3], separator: ", ")
// Prints "1, 7"


print(emptyDoubles[0])
// Triggers runtime error: Index out of range

```

# [Adding and Removing Elements](https://developer.apple.com/documentation/Swift/Array#Adding-and-Removing-Elements)
Suppose you need to store a list of the names of students that are signed up for a class you’re teaching. During the registration period, you need to add and remove names as students add and drop the class.
```
var students = ["Ben", "Ivy", "Jordell"]

```

To add single elements to the end of an array, use the `append(_:)` method. Add multiple elements at the same time by passing another array or a sequence of any kind to the `append(contentsOf:)` method.
```
students.append("Maxime")
students.append(contentsOf: ["Shakia", "William"])
// ["Ben", "Ivy", "Jordell", "Maxime", "Shakia", "William"]

```

You can add new elements in the middle of an array by using the `insert(_:at:)` method for single elements and by using `insert(contentsOf:at:)` to insert multiple elements from another collection or array literal. The elements at that index and later indices are shifted back to make room.
```
students.insert("Liam", at: 3)
// ["Ben", "Ivy", "Jordell", "Liam", "Maxime", "Shakia", "William"]

```

To remove elements from an array, use the `remove(at:)`, `removeSubrange(_:)`, and `removeLast()` methods.
```
// Ben's family is moving to another state
students.remove(at: 0)
// ["Ivy", "Jordell", "Liam", "Maxime", "Shakia", "William"]


// William is signing up for a different class
students.removeLast()
// ["Ivy", "Jordell", "Liam", "Maxime", "Shakia"]

```

You can replace an existing element with a new value by assigning the new value to the subscript.
```
if let i = students.firstIndex(of: "Maxime") {
    students[i] = "Max"
}
// ["Ivy", "Jordell", "Liam", "Max", "Shakia"]

```

## [Growing the Size of an Array](https://developer.apple.com/documentation/Swift/Array#Growing-the-Size-of-an-Array)
Every array reserves a specific amount of memory to hold its contents. When you add elements to an array and that array begins to exceed its reserved capacity, the array allocates a larger region of memory and copies its elements into the new storage. The new storage is a multiple of the old storage’s size. This exponential growth strategy means that appending an element happens in constant time, averaging the performance of many append operations. Append operations that trigger reallocation have a performance cost, but they occur less and less often as the array grows larger.
If you know approximately how many elements you will need to store, use the `reserveCapacity(_:)` method before appending to the array to avoid intermediate reallocations. Use the `capacity` and `count` properties to determine how many more elements the array can store without allocating larger storage.
For arrays of most `Element` types, this storage is a contiguous block of memory. For arrays with an `Element` type that is a class or `@objc` protocol type, this storage can be a contiguous block of memory or an instance of `NSArray`. Because any arbitrary subclass of `NSArray` can become an `Array`, there are no guarantees about representation or efficiency in this case.
# [Modifying Copies of Arrays](https://developer.apple.com/documentation/Swift/Array#Modifying-Copies-of-Arrays)
Each array has an independent value that includes the values of all of its elements. For simple types such as integers and other structures, this means that when you change a value in one array, the value of that element does not change in any copies of the array. For example:
```
var numbers = [1, 2, 3, 4, 5]
var numbersCopy = numbers
numbers[0] = 100
print(numbers)
// Prints "[100, 2, 3, 4, 5]"
print(numbersCopy)
// Prints "[1, 2, 3, 4, 5]"

```

If the elements in an array are instances of a class, the semantics are the same, though they might appear different at first. In this case, the values stored in the array are references to objects that live outside the array. If you change a reference to an object in one array, only that array has a reference to the new object. However, if two arrays contain references to the same object, you can observe changes to that object’s properties from both arrays. For example:
```
// An integer type with reference semantics
class IntegerReference {
    var value = 10
}
var firstIntegers = [IntegerReference(), IntegerReference()]
var secondIntegers = firstIntegers


// Modifications to an instance are visible from either array
firstIntegers[0].value = 100
print(secondIntegers[0].value)
// Prints "100"


// Replacements, additions, and removals are still visible
// only in the modified array
firstIntegers[0] = IntegerReference()
print(firstIntegers[0].value)
// Prints "10"
print(secondIntegers[0].value)
// Prints "100"

```

Arrays, like all variable-size collections in the standard library, use copy-on-write optimization. Multiple copies of an array share the same storage until you modify one of the copies. When that happens, the array being modified replaces its storage with a uniquely owned copy of itself, which is then modified in place. Optimizations are sometimes applied that can reduce the amount of copying.
This means that if an array is sharing storage with other copies, the first mutating operation on that array incurs the cost of copying the array. An array that is the sole owner of its storage can perform mutating operations in place.
In the example below, a `numbers` array is created along with two copies that share the same storage. When the original `numbers` array is modified, it makes a unique copy of its storage before making the modification. Further modifications to `numbers` are made in place, while the two copies continue to share the original storage.
```
var numbers = [1, 2, 3, 4, 5]
var firstCopy = numbers
var secondCopy = numbers


// The storage for 'numbers' is copied here
numbers[0] = 100
numbers[1] = 200
numbers[2] = 300
// 'numbers' is [100, 200, 300, 4, 5]
// 'firstCopy' and 'secondCopy' are [1, 2, 3, 4, 5]

```

# [Bridging Between Array and NSArray](https://developer.apple.com/documentation/Swift/Array#Bridging-Between-Array-and-NSArray)
When you need to access APIs that require data in an `NSArray` instance instead of `Array`, use the type-cast operator (`as`) to bridge your instance. For bridging to be possible, the `Element` type of your array must be a class, an `@objc` protocol (a protocol imported from Objective-C or marked with the `@objc` attribute), or a type that bridges to a Foundation type.
The following example shows how you can bridge an `Array` instance to `NSArray` to use the `write(to:atomically:)` method. In this example, the `colors` array can be bridged to `NSArray` because the `colors` array’s `String` elements bridge to `NSString`. The compiler prevents bridging the `moreColors` array, on the other hand, because its `Element` type is `Optional<String>`, which does _not_ bridge to a Foundation type.
```
let colors = ["periwinkle", "rose", "moss"]
let moreColors: [String?] = ["ochre", "pine"]


let url = URL(fileURLWithPath: "names.plist")
(colors as NSArray).write(to: url, atomically: true)
// true


(moreColors as NSArray).write(to: url, atomically: true)
// error: cannot convert value of type '[String?]' to type 'NSArray'

```

Bridging from `Array` to `NSArray` takes O(1) time and O(1) space if the array’s elements are already instances of a class or an `@objc` protocol; otherwise, it takes O(_n_) time and space.
When the destination array’s element type is a class or an `@objc` protocol, bridging from `NSArray` to `Array` first calls the `copy(with:)` (`- copyWithZone:` in Objective-C) method on the array to get an immutable copy and then performs additional Swift bookkeeping work that takes O(1) time. For instances of `NSArray` that are already immutable, `copy(with:)` usually returns the same array in O(1) time; otherwise, the copying performance is unspecified. If `copy(with:)` returns the same array, the instances of `NSArray` and `Array` share storage using the same copy-on-write optimization that is used when two instances of `Array` share storage.
When the destination array’s element type is a nonclass type that bridges to a Foundation type, bridging from `NSArray` to `Array` performs a bridging copy of the elements to contiguous storage in O(_n_) time. For example, bridging from `NSArray` to `Array<Int>` performs such a copy. No further bridging is required when accessing elements of the `Array` instance.
Note
The `ContiguousArray` and `ArraySlice` types are not bridged; instances of those types always have a contiguous block of memory as their storage.
## [Topics](https://developer.apple.com/documentation/Swift/Array#topics)
### [Creating an Array](https://developer.apple.com/documentation/Swift/Array#Creating-an-Array)
In addition to using an array literal, you can also create an array using these initializers.
[`init()`](https://developer.apple.com/documentation/swift/array/init\(\))
Creates a new, empty array.
[`init<S>(S)`](https://developer.apple.com/documentation/swift/array/init\(_:\)-1ip9h)
Creates a new instance of a collection containing the elements of a sequence.
[`init<S>(S)`](https://developer.apple.com/documentation/swift/array/init\(_:\)-236cl)
Creates an array containing the elements of a sequence.
[`init(repeating: Element, count: Int)`](https://developer.apple.com/documentation/swift/array/init\(repeating:count:\))
Creates a new array containing the specified number of a single, repeated value.
[`init(unsafeUninitializedCapacity: Int, initializingWith: (inout UnsafeMutableBufferPointer<Element>, inout Int) throws -> Void) rethrows`](https://developer.apple.com/documentation/swift/array/init\(unsafeuninitializedcapacity:initializingwith:\))
Creates an array with the specified capacity, then calls the given closure with a buffer covering the array’s uninitialized memory.
### [Inspecting an Array](https://developer.apple.com/documentation/Swift/Array#Inspecting-an-Array)
[`var isEmpty: Bool`](https://developer.apple.com/documentation/swift/array/isempty)
A Boolean value indicating whether the collection is empty.
[`var count: Int`](https://developer.apple.com/documentation/swift/array/count)
The number of elements in the array.
[`var capacity: Int`](https://developer.apple.com/documentation/swift/array/capacity)
The total number of elements that the array can contain without allocating new storage.
### [Accessing Elements](https://developer.apple.com/documentation/Swift/Array#Accessing-Elements)
[`subscript(Int) -> Element`](https://developer.apple.com/documentation/swift/array/subscript\(_:\)-25iat)
Accesses the element at the specified position.
[`var first: Self.Element?`](https://developer.apple.com/documentation/swift/array/first)
The first element of the collection.
[`var last: Self.Element?`](https://developer.apple.com/documentation/swift/array/last)
The last element of the collection.
[`subscript(Range<Int>) -> ArraySlice<Element>`](https://developer.apple.com/documentation/swift/array/subscript\(_:\)-53fvb)
Accesses a contiguous subrange of the array’s elements.
[`subscript<R>(R) -> Self.SubSequence`](https://developer.apple.com/documentation/swift/array/subscript\(_:\)-3kwny)
[`subscript<R>(R) -> Self.SubSequence`](https://developer.apple.com/documentation/swift/array/subscript\(_:\)-4h7rl)
Accesses the contiguous subrange of the collection’s elements specified by a range expression.
[`subscript((UnboundedRange_) -> ()) -> Self.SubSequence`](https://developer.apple.com/documentation/swift/array/subscript\(_:\)-3pmfg)
[`func randomElement() -> Self.Element?`](https://developer.apple.com/documentation/swift/array/randomelement\(\))
Returns a random element of the collection.
[`func randomElement<T>(using: inout T) -> Self.Element?`](https://developer.apple.com/documentation/swift/array/randomelement\(using:\))
Returns a random element of the collection, using the given generator as a source for randomness.
### [Adding Elements](https://developer.apple.com/documentation/Swift/Array#Adding-Elements)
[`func append(Element)`](https://developer.apple.com/documentation/swift/array/append\(_:\))
Adds a new element at the end of the array.
[`func insert(Element, at: Int)`](https://developer.apple.com/documentation/swift/array/insert\(_:at:\))
Inserts a new element at the specified position.
[`func insert<C>(contentsOf: C, at: Self.Index)`](https://developer.apple.com/documentation/swift/array/insert\(contentsof:at:\))
Inserts the elements of a sequence into the collection at the specified position.
[`func replaceSubrange<C>(Range<Int>, with: C)`](https://developer.apple.com/documentation/swift/array/replacesubrange\(_:with:\))
Replaces a range of elements with the elements in the specified collection.
[`func replaceSubrange<C, R>(R, with: C)`](https://developer.apple.com/documentation/swift/array/replacesubrange\(_:with:\)-7293p)
Replaces the specified subrange of elements with the given collection.
[`func reserveCapacity(Int)`](https://developer.apple.com/documentation/swift/array/reservecapacity\(_:\))
Reserves enough space to store the specified number of elements.
### [Combining Arrays](https://developer.apple.com/documentation/Swift/Array#Combining-Arrays)
[`func append<S>(contentsOf: S)`](https://developer.apple.com/documentation/swift/array/append\(contentsof:\))
Adds the elements of a sequence to the end of the array.
[`func append<S>(contentsOf: S)`](https://developer.apple.com/documentation/swift/array/append\(contentsof:\)-9foli)
Adds the elements of a sequence or collection to the end of this collection.
[`static func + <Other>(Other, Self) -> Self`](https://developer.apple.com/documentation/swift/array/+\(_:_:\)-6h58k)
Creates a new collection by concatenating the elements of a sequence and a collection.
[`static func + <Other>(Self, Other) -> Self`](https://developer.apple.com/documentation/swift/array/+\(_:_:\)-n33n)
Creates a new collection by concatenating the elements of a collection and a sequence.
[`static func + (Array<Element>, Array<Element>) -> Array<Element>`](https://developer.apple.com/documentation/swift/array/+\(_:_:\))
[`static func + <Other>(Self, Other) -> Self`](https://developer.apple.com/documentation/swift/array/+\(_:_:\)-9fm5l)
Creates a new collection by concatenating the elements of two collections.
[`static func += <Other>(inout Self, Other)`](https://developer.apple.com/documentation/swift/array/+=\(_:_:\)-676ib)
Appends the elements of a sequence to a range-replaceable collection.
[`static func += (inout Array<Element>, Array<Element>)`](https://developer.apple.com/documentation/swift/array/+=\(_:_:\))
### [Removing Elements](https://developer.apple.com/documentation/Swift/Array#Removing-Elements)
[`func remove(at: Int) -> Element`](https://developer.apple.com/documentation/swift/array/remove\(at:\))
Removes and returns the element at the specified position.
[`func removeFirst() -> Self.Element`](https://developer.apple.com/documentation/swift/array/removefirst\(\))
Removes and returns the first element of the collection.
[`func removeFirst(Int)`](https://developer.apple.com/documentation/swift/array/removefirst\(_:\))
Removes the specified number of elements from the beginning of the collection.
[`func removeLast() -> Self.Element`](https://developer.apple.com/documentation/swift/array/removelast\(\))
Removes and returns the last element of the collection.
[`func removeLast(Int)`](https://developer.apple.com/documentation/swift/array/removelast\(_:\))
Removes the specified number of elements from the end of the collection.
[`func removeSubrange(Range<Self.Index>)`](https://developer.apple.com/documentation/swift/array/removesubrange\(_:\)-8may1)
Removes the elements in the specified subrange from the collection.
[`func removeSubrange<R>(R)`](https://developer.apple.com/documentation/swift/array/removesubrange\(_:\)-9twou)
Removes the elements in the specified subrange from the collection.
[`func removeAll(where: (Self.Element) throws -> Bool) rethrows`](https://developer.apple.com/documentation/swift/array/removeall\(where:\)-5k61r)
Removes all the elements that satisfy the given predicate.
[`func removeAll(keepingCapacity: Bool)`](https://developer.apple.com/documentation/swift/array/removeall\(keepingcapacity:\))
Removes all elements from the array.
[`func popLast() -> Self.Element?`](https://developer.apple.com/documentation/swift/array/poplast\(\))
Removes and returns the last element of the collection.
### [Finding Elements](https://developer.apple.com/documentation/Swift/Array#Finding-Elements)
[`func contains(Self.Element) -> Bool`](https://developer.apple.com/documentation/swift/array/contains\(_:\))
Returns a Boolean value indicating whether the sequence contains the given element.
[`func contains(where: (Self.Element) throws -> Bool) rethrows -> Bool`](https://developer.apple.com/documentation/swift/array/contains\(where:\))
Returns a Boolean value indicating whether the sequence contains an element that satisfies the given predicate.
[`func allSatisfy((Self.Element) throws -> Bool) rethrows -> Bool`](https://developer.apple.com/documentation/swift/array/allsatisfy\(_:\))
Returns a Boolean value indicating whether every element of a sequence satisfies a given predicate.
[`func first(where: (Self.Element) throws -> Bool) rethrows -> Self.Element?`](https://developer.apple.com/documentation/swift/array/first\(where:\))
Returns the first element of the sequence that satisfies the given predicate.
[`func firstIndex(of: Self.Element) -> Self.Index?`](https://developer.apple.com/documentation/swift/array/firstindex\(of:\))
Returns the first index where the specified value appears in the collection.
[`func index(of: Self.Element) -> Self.Index?`](https://developer.apple.com/documentation/swift/array/index\(of:\))
Returns the first index where the specified value appears in the collection.
[`func firstIndex(where: (Self.Element) throws -> Bool) rethrows -> Self.Index?`](https://developer.apple.com/documentation/swift/array/firstindex\(where:\))
Returns the first index in which an element of the collection satisfies the given predicate.
[`func last(where: (Self.Element) throws -> Bool) rethrows -> Self.Element?`](https://developer.apple.com/documentation/swift/array/last\(where:\))
Returns the last element of the sequence that satisfies the given predicate.
[`func lastIndex(of: Self.Element) -> Self.Index?`](https://developer.apple.com/documentation/swift/array/lastindex\(of:\))
Returns the last index where the specified value appears in the collection.
[`func lastIndex(where: (Self.Element) throws -> Bool) rethrows -> Self.Index?`](https://developer.apple.com/documentation/swift/array/lastindex\(where:\))
Returns the index of the last element in the collection that matches the given predicate.
[`func min() -> Self.Element?`](https://developer.apple.com/documentation/swift/array/min\(\))
Returns the minimum element in the sequence.
[`func min(by: (Self.Element, Self.Element) throws -> Bool) rethrows -> Self.Element?`](https://developer.apple.com/documentation/swift/array/min\(by:\))
Returns the minimum element in the sequence, using the given predicate as the comparison between elements.
[`func max() -> Self.Element?`](https://developer.apple.com/documentation/swift/array/max\(\))
Returns the maximum element in the sequence.
[`func max(by: (Self.Element, Self.Element) throws -> Bool) rethrows -> Self.Element?`](https://developer.apple.com/documentation/swift/array/max\(by:\))
Returns the maximum element in the sequence, using the given predicate as the comparison between elements.
### [Selecting Elements](https://developer.apple.com/documentation/Swift/Array#Selecting-Elements)
[`func prefix(Int) -> Self.SubSequence`](https://developer.apple.com/documentation/swift/array/prefix\(_:\))
Returns a subsequence, up to the specified maximum length, containing the initial elements of the collection.
[`func prefix(through: Self.Index) -> Self.SubSequence`](https://developer.apple.com/documentation/swift/array/prefix\(through:\))
Returns a subsequence from the start of the collection through the specified position.
[`func prefix(upTo: Self.Index) -> Self.SubSequence`](https://developer.apple.com/documentation/swift/array/prefix\(upto:\))
Returns a subsequence from the start of the collection up to, but not including, the specified position.
[`func prefix(while: (Self.Element) throws -> Bool) rethrows -> Self.SubSequence`](https://developer.apple.com/documentation/swift/array/prefix\(while:\))
Returns a subsequence containing the initial elements until `predicate` returns `false` and skipping the remaining elements.
[`func suffix(Int) -> Self.SubSequence`](https://developer.apple.com/documentation/swift/array/suffix\(_:\))
Returns a subsequence, up to the given maximum length, containing the final elements of the collection.
[`func suffix(from: Self.Index) -> Self.SubSequence`](https://developer.apple.com/documentation/swift/array/suffix\(from:\))
Returns a subsequence from the specified position to the end of the collection.
### [Excluding Elements](https://developer.apple.com/documentation/Swift/Array#Excluding-Elements)
[`func dropFirst(Int) -> Self.SubSequence`](https://developer.apple.com/documentation/swift/array/dropfirst\(_:\))
Returns a subsequence containing all but the given number of initial elements.
[`func dropLast(Int) -> Self.SubSequence`](https://developer.apple.com/documentation/swift/array/droplast\(_:\))
Returns a subsequence containing all but the specified number of final elements.
[`func drop(while: (Self.Element) throws -> Bool) rethrows -> Self.SubSequence`](https://developer.apple.com/documentation/swift/array/drop\(while:\))
Returns a subsequence by skipping elements while `predicate` returns `true` and returning the remaining elements.
### [Transforming an Array](https://developer.apple.com/documentation/Swift/Array#Transforming-an-Array)
[`func flatMap<SegmentOfResult>((Self.Element) throws -> SegmentOfResult) rethrows -> [SegmentOfResult.Element]`](https://developer.apple.com/documentation/swift/array/flatmap\(_:\)-i3mr)
Returns an array containing the concatenated results of calling the given transformation with each element of this sequence.
[`func flatMap<ElementOfResult>((Self.Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult]`](https://developer.apple.com/documentation/swift/array/flatmap\(_:\)-6chu8)
[`func compactMap<ElementOfResult>((Self.Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult]`](https://developer.apple.com/documentation/swift/array/compactmap\(_:\))
Returns an array containing the non-`nil` results of calling the given transformation with each element of this sequence.
[`func reduce<Result>(Result, (Result, Self.Element) throws -> Result) rethrows -> Result`](https://developer.apple.com/documentation/swift/array/reduce\(_:_:\))
Returns the result of combining the elements of the sequence using the given closure.
[`func reduce<Result>(into: Result, (inout Result, Self.Element) throws -> ()) rethrows -> Result`](https://developer.apple.com/documentation/swift/array/reduce\(into:_:\))
Returns the result of combining the elements of the sequence using the given closure.
[`var lazy: LazySequence<Self>`](https://developer.apple.com/documentation/swift/array/lazy)
A sequence containing the same elements as this sequence, but on which some operations, such as `map` and `filter`, are implemented lazily.
### [Iterating Over an Array’s Elements](https://developer.apple.com/documentation/Swift/Array#Iterating-Over-an-Arrays-Elements)
[`func forEach((Self.Element) throws -> Void) rethrows`](https://developer.apple.com/documentation/swift/array/foreach\(_:\))
Calls the given closure on each element in the sequence in the same order as a `for`-`in` loop.
[`func enumerated() -> EnumeratedSequence<Self>`](https://developer.apple.com/documentation/swift/array/enumerated\(\))
Returns a sequence of pairs (_n_ , _x_), where _n_ represents a consecutive integer starting at zero and _x_ represents an element of the sequence.
[`func makeIterator() -> IndexingIterator<Self>`](https://developer.apple.com/documentation/swift/array/makeiterator\(\))
Returns an iterator over the elements of the collection.
[`var underestimatedCount: Int`](https://developer.apple.com/documentation/swift/array/underestimatedcount)
A value less than or equal to the number of elements in the collection.
### [Reordering an Array’s Elements](https://developer.apple.com/documentation/Swift/Array#Reordering-an-Arrays-Elements)
[`func sort()`](https://developer.apple.com/documentation/swift/array/sort\(\))
Sorts the collection in place.
[`func sort(by: (Self.Element, Self.Element) throws -> Bool) rethrows`](https://developer.apple.com/documentation/swift/array/sort\(by:\))
Sorts the collection in place, using the given predicate as the comparison between elements.
[`func sorted() -> [Self.Element]`](https://developer.apple.com/documentation/swift/array/sorted\(\))
Returns the elements of the sequence, sorted.
[`func sorted(by: (Self.Element, Self.Element) throws -> Bool) rethrows -> [Self.Element]`](https://developer.apple.com/documentation/swift/array/sorted\(by:\))
Returns the elements of the sequence, sorted using the given predicate as the comparison between elements.
[`func reverse()`](https://developer.apple.com/documentation/swift/array/reverse\(\))
Reverses the elements of the collection in place.
[`func reversed() -> ReversedCollection<Self>`](https://developer.apple.com/documentation/swift/array/reversed\(\))
Returns a view presenting the elements of the collection in reverse order.
[`func shuffle()`](https://developer.apple.com/documentation/swift/array/shuffle\(\))
Shuffles the collection in place.
[`func shuffle<T>(using: inout T)`](https://developer.apple.com/documentation/swift/array/shuffle\(using:\))
Shuffles the collection in place, using the given generator as a source for randomness.
[`func shuffled() -> [Self.Element]`](https://developer.apple.com/documentation/swift/array/shuffled\(\))
Returns the elements of the sequence, shuffled.
[`func shuffled<T>(using: inout T) -> [Self.Element]`](https://developer.apple.com/documentation/swift/array/shuffled\(using:\))
Returns the elements of the sequence, shuffled using the given generator as a source for randomness.
[`func partition(by: (Self.Element) throws -> Bool) rethrows -> Self.Index`](https://developer.apple.com/documentation/swift/array/partition\(by:\)-90po8)
Reorders the elements of the collection such that all the elements that match the given predicate are after all the elements that don’t match.
[`func swapAt(Self.Index, Self.Index)`](https://developer.apple.com/documentation/swift/array/swapat\(_:_:\))
Exchanges the values at the specified indices of the collection.
### [Splitting and Joining Elements](https://developer.apple.com/documentation/Swift/Array#Splitting-and-Joining-Elements)
[`func split(separator: Self.Element, maxSplits: Int, omittingEmptySubsequences: Bool) -> [Self.SubSequence]`](https://developer.apple.com/documentation/swift/array/split\(separator:maxsplits:omittingemptysubsequences:\)-3dgmv)
Returns the longest possible subsequences of the collection, in order, around elements equal to the given element.
[`func split(maxSplits: Int, omittingEmptySubsequences: Bool, whereSeparator: (Self.Element) throws -> Bool) rethrows -> [Self.SubSequence]`](https://developer.apple.com/documentation/swift/array/split\(maxsplits:omittingemptysubsequences:whereseparator:\))
Returns the longest possible subsequences of the collection, in order, that don’t contain elements satisfying the given predicate.
[`func joined() -> FlattenSequence<Self>`](https://developer.apple.com/documentation/swift/array/joined\(\))
Returns the elements of this sequence of sequences, concatenated.
[`func joined<Separator>(separator: Separator) -> JoinedSequence<Self>`](https://developer.apple.com/documentation/swift/array/joined\(separator:\)-7uber)
Returns the concatenated elements of this sequence of sequences, inserting the given separator between each element.
[`func joined(separator: String) -> String`](https://developer.apple.com/documentation/swift/array/joined\(separator:\)-5do1g)
Returns a new string by concatenating the elements of the sequence, adding the given separator between each element.
[`func joined(separator: String) -> String`](https://developer.apple.com/documentation/swift/array/joined\(separator:\)-1ckod)
Returns a new string by concatenating the elements of the sequence, adding the given separator between each element.
### [Creating and Applying Differences](https://developer.apple.com/documentation/Swift/Array#Creating-and-Applying-Differences)
[`func applying(CollectionDifference<Self.Element>) -> Self?`](https://developer.apple.com/documentation/swift/array/applying\(_:\))
Applies the given difference to this collection.
[`func difference<C>(from: C) -> CollectionDifference<Self.Element>`](https://developer.apple.com/documentation/swift/array/difference\(from:\))
Returns the difference needed to produce this collection’s ordered elements from the given collection.
[`func difference<C>(from: C, by: (C.Element, Self.Element) -> Bool) -> CollectionDifference<Self.Element>`](https://developer.apple.com/documentation/swift/array/difference\(from:by:\))
Returns the difference needed to produce this collection’s ordered elements from the given collection, using the given predicate as an equivalence test.
### [Comparing Arrays](https://developer.apple.com/documentation/Swift/Array#Comparing-Arrays)
[`static func == (Array<Element>, Array<Element>) -> Bool`](https://developer.apple.com/documentation/swift/array/==\(_:_:\))
Returns a Boolean value indicating whether two arrays contain the same elements in the same order.
[`static func != (Self, Self) -> Bool`](https://developer.apple.com/documentation/swift/array/!=\(_:_:\))
Returns a Boolean value indicating whether two values are not equal.
[`func elementsEqual<OtherSequence>(OtherSequence) -> Bool`](https://developer.apple.com/documentation/swift/array/elementsequal\(_:\))
Returns a Boolean value indicating whether this sequence and another sequence contain the same elements in the same order.
[`func elementsEqual<OtherSequence>(OtherSequence, by: (Self.Element, OtherSequence.Element) throws -> Bool) rethrows -> Bool`](https://developer.apple.com/documentation/swift/array/elementsequal\(_:by:\))
Returns a Boolean value indicating whether this sequence and another sequence contain equivalent elements in the same order, using the given predicate as the equivalence test.
[`func starts<PossiblePrefix>(with: PossiblePrefix) -> Bool`](https://developer.apple.com/documentation/swift/array/starts\(with:\))
Returns a Boolean value indicating whether the initial elements of the sequence are the same as the elements in another sequence.
[`func starts<PossiblePrefix>(with: PossiblePrefix, by: (Self.Element, PossiblePrefix.Element) throws -> Bool) rethrows -> Bool`](https://developer.apple.com/documentation/swift/array/starts\(with:by:\))
Returns a Boolean value indicating whether the initial elements of the sequence are equivalent to the elements in another sequence, using the given predicate as the equivalence test.
[`func lexicographicallyPrecedes<OtherSequence>(OtherSequence) -> Bool`](https://developer.apple.com/documentation/swift/array/lexicographicallyprecedes\(_:\))
Returns a Boolean value indicating whether the sequence precedes another sequence in a lexicographical (dictionary) ordering, using the less-than operator (`<`) to compare elements.
[`func lexicographicallyPrecedes<OtherSequence>(OtherSequence, by: (Self.Element, Self.Element) throws -> Bool) rethrows -> Bool`](https://developer.apple.com/documentation/swift/array/lexicographicallyprecedes\(_:by:\))
Returns a Boolean value indicating whether the sequence precedes another sequence in a lexicographical (dictionary) ordering, using the given predicate to compare elements.
### [Manipulating Indices](https://developer.apple.com/documentation/Swift/Array#Manipulating-Indices)
[`var startIndex: Int`](https://developer.apple.com/documentation/swift/array/startindex)
The position of the first element in a nonempty array.
[`var endIndex: Int`](https://developer.apple.com/documentation/swift/array/endindex)
The array’s “past the end” position—that is, the position one greater than the last valid subscript argument.
[`func index(after: Int) -> Int`](https://developer.apple.com/documentation/swift/array/index\(after:\))
Returns the position immediately after the given index.
[`func formIndex(after: inout Int)`](https://developer.apple.com/documentation/swift/array/formindex\(after:\))
Replaces the given index with its successor.
[`func index(before: Int) -> Int`](https://developer.apple.com/documentation/swift/array/index\(before:\))
Returns the position immediately before the given index.
[`func formIndex(before: inout Int)`](https://developer.apple.com/documentation/swift/array/formindex\(before:\))
Replaces the given index with its predecessor.
[`func index(Int, offsetBy: Int) -> Int`](https://developer.apple.com/documentation/swift/array/index\(_:offsetby:\))
Returns an index that is the specified distance from the given index.
[`func formIndex(inout Self.Index, offsetBy: Int)`](https://developer.apple.com/documentation/swift/array/formindex\(_:offsetby:\))
Offsets the given index by the specified distance.
[`func index(Int, offsetBy: Int, limitedBy: Int) -> Int?`](https://developer.apple.com/documentation/swift/array/index\(_:offsetby:limitedby:\))
Returns an index that is the specified distance from the given index, unless that distance is beyond a given limiting index.
[`func formIndex(inout Self.Index, offsetBy: Int, limitedBy: Self.Index) -> Bool`](https://developer.apple.com/documentation/swift/array/formindex\(_:offsetby:limitedby:\))
Offsets the given index by the specified distance, or so that it equals the given limiting index.
[`func distance(from: Int, to: Int) -> Int`](https://developer.apple.com/documentation/swift/array/distance\(from:to:\))
Returns the distance between two indices.
### [Accessing Underlying Storage](https://developer.apple.com/documentation/Swift/Array#Accessing-Underlying-Storage)
[`func withUnsafeBufferPointer<R, E>((UnsafeBufferPointer<Element>) throws(E) -> R) throws(E) -> R`](https://developer.apple.com/documentation/swift/array/withunsafebufferpointer\(_:\))
Calls a closure with a pointer to the array’s contiguous storage.
[`func withUnsafeMutableBufferPointer<R, E>((inout UnsafeMutableBufferPointer<Element>) throws(E) -> R) throws(E) -> R`](https://developer.apple.com/documentation/swift/array/withunsafemutablebufferpointer\(_:\))
Calls the given closure with a pointer to the array’s mutable contiguous storage.
[`func withUnsafeBytes<R>((UnsafeRawBufferPointer) throws -> R) rethrows -> R`](https://developer.apple.com/documentation/swift/array/withunsafebytes\(_:\))
Calls the given closure with a pointer to the underlying bytes of the array’s contiguous storage.
[`func withUnsafeMutableBytes<R>((UnsafeMutableRawBufferPointer) throws -> R) rethrows -> R`](https://developer.apple.com/documentation/swift/array/withunsafemutablebytes\(_:\))
Calls the given closure with a pointer to the underlying bytes of the array’s mutable contiguous storage.
[`func withContiguousStorageIfAvailable<R>((UnsafeBufferPointer<Element>) throws -> R) rethrows -> R?`](https://developer.apple.com/documentation/swift/array/withcontiguousstorageifavailable\(_:\))
Executes a closure on the sequence’s contiguous storage.
[`func withContiguousMutableStorageIfAvailable<R>((inout UnsafeMutableBufferPointer<Element>) throws -> R) rethrows -> R?`](https://developer.apple.com/documentation/swift/array/withcontiguousmutablestorageifavailable\(_:\))
Executes a closure on the collection’s contiguous storage.
### [Encoding and Decoding](https://developer.apple.com/documentation/Swift/Array#Encoding-and-Decoding)
[`func encode(to: any Encoder) throws`](https://developer.apple.com/documentation/swift/array/encode\(to:\))
Encodes the elements of this array into the given encoder in an unkeyed container.
[`init(from: any Decoder) throws`](https://developer.apple.com/documentation/swift/array/init\(from:\))
Creates a new array by decoding from the given decoder.
### [Describing an Array](https://developer.apple.com/documentation/Swift/Array#Describing-an-Array)
[`var description: String`](https://developer.apple.com/documentation/swift/array/description)
A textual representation of the array and its elements.
[`var debugDescription: String`](https://developer.apple.com/documentation/swift/array/debugdescription)
A textual representation of the array and its elements, suitable for debugging.
[`var customMirror: Mirror`](https://developer.apple.com/documentation/swift/array/custommirror)
A mirror that reflects the array.
[`func hash(into: inout Hasher)`](https://developer.apple.com/documentation/swift/array/hash\(into:\))
Hashes the essential components of this value by feeding them into the given hasher.
### [Converting Between Arrays and Create ML Types](https://developer.apple.com/documentation/Swift/Array#Converting-Between-Arrays-and-Create-ML-Types)
[`init(MLDataColumn<Element>)`](https://developer.apple.com/documentation/swift/array/init\(_:\)-2ln1a)
Constructs an Array with the elements of a DataColumn.
[`init(MLUntypedColumn)`](https://developer.apple.com/documentation/swift/array/init\(_:\)-86ka8)
Constructs an Array with the elements of an MLUntypedColumn.
### [Related Array Types](https://developer.apple.com/documentation/Swift/Array#Related-Array-Types)
[`struct ContiguousArray`](https://developer.apple.com/documentation/swift/contiguousarray)
A contiguously stored array.
[`struct ArraySlice`](https://developer.apple.com/documentation/swift/arrayslice)
A slice of an `Array`, `ContiguousArray`, or `ArraySlice` instance.
### [Reference Types](https://developer.apple.com/documentation/Swift/Array#Reference-Types)
Use bridged reference types when you need reference semantics or Foundation-specific behavior.
[`class NSArray`](https://developer.apple.com/documentation/Foundation/NSArray)
A static ordered collection of objects.
[`class NSMutableArray`](https://developer.apple.com/documentation/Foundation/NSMutableArray)
A dynamic ordered collection of objects.
### [Supporting Types](https://developer.apple.com/documentation/Swift/Array#Supporting-Types)
[`typealias Index`](https://developer.apple.com/documentation/swift/array/index)
The index type for arrays, `Int`.
[`typealias Indices`](https://developer.apple.com/documentation/swift/array/indices)
The type that represents the indices that are valid for subscripting an array, in ascending order.
[`typealias Iterator`](https://developer.apple.com/documentation/swift/array/iterator)
The type that allows iteration over an array’s elements.
[`typealias ArrayLiteralElement`](https://developer.apple.com/documentation/swift/array/arrayliteralelement)
The type of the elements of an array literal.
[`typealias SubSequence`](https://developer.apple.com/documentation/swift/array/subsequence)
A collection representing a contiguous subrange of this collection’s elements. The subsequence shares indices with the original collection.
### [Infrequently Used Functionality](https://developer.apple.com/documentation/Swift/Array#Infrequently-Used-Functionality)
[`init(arrayLiteral: Element...)`](https://developer.apple.com/documentation/swift/array/init\(arrayliteral:\))
Creates an array from the given array literal.
[`var hashValue: Int`](https://developer.apple.com/documentation/swift/array/hashvalue)
The hash value.
### [Initializers](https://developer.apple.com/documentation/Swift/Array#Initializers)
[`init(fromSplitComplex: DSPSplitComplex, scale: Float, count: Int)`](https://developer.apple.com/documentation/swift/array/init\(fromsplitcomplex:scale:count:\)-5eirc)
Creates a new array of single-precision values from a `DSPSplitComplex` structure.
[`init(fromSplitComplex: DSPDoubleSplitComplex, scale: Double, count: Int)`](https://developer.apple.com/documentation/swift/array/init\(fromsplitcomplex:scale:count:\)-5kgr3)
Creates a new array of single-precision values from a `DSPDoubleSplitComplex` structure.
### [Instance Properties](https://developer.apple.com/documentation/Swift/Array#Instance-Properties)
[`var mutableSpan: MutableSpan<Element>`](https://developer.apple.com/documentation/swift/array/mutablespan)
[`var span: Span<Element>`](https://developer.apple.com/documentation/swift/array/span)
### [Instance Methods](https://developer.apple.com/documentation/Swift/Array#Instance-Methods)
[`func withUnsafeTaggedBuffers<R>(([CMTaggedBuffer]) throws -> sending R) rethrows -> sending R`](https://developer.apple.com/documentation/swift/array/withunsafetaggedbuffers\(_:\))
Access the underlying CMTaggedBuffers.
### [Type Aliases](https://developer.apple.com/documentation/Swift/Array#Type-Aliases)
[`typealias Specification`](https://developer.apple.com/documentation/swift/array/specification)
[`typealias UnderlyingSequence`](https://developer.apple.com/documentation/swift/array/underlyingsequence)
[`typealias UnwrappedType`](https://developer.apple.com/documentation/swift/array/unwrappedtype)
[`typealias ValueType`](https://developer.apple.com/documentation/swift/array/valuetype)
### [Type Properties](https://developer.apple.com/documentation/Swift/Array#Type-Properties)
[`static var defaultResolverSpecification: EmptyResolverSpecification<Array<Element>>`](https://developer.apple.com/documentation/swift/array/defaultresolverspecification)
### [Type Methods](https://developer.apple.com/documentation/Swift/Array#Type-Methods)
[`static func monoscopicForVideoOutput() -> [CMTag]`](https://developer.apple.com/documentation/swift/array/monoscopicforvideooutput\(\))
Creates a collection of CMTags with the required tags to describe monoscopic video, where there is no stereo view, e.g. kCMTagStereoNone.
[`static func stereoscopicForVideoOutput() -> [CMTag]`](https://developer.apple.com/documentation/swift/array/stereoscopicforvideooutput\(\))
Creates a collection of CMTags with the required tags to describe basic stereoscopic video, where both left and right stereo eyes are present, e.g. kCMTagStereoLeftAndRight.
### [Default Implementations](https://developer.apple.com/documentation/Swift/Array#Default-Implementations)
[API Reference BidirectionalCollection Implementations](https://developer.apple.com/documentation/swift/array/bidirectionalcollection-implementations)
[API Reference Collection Implementations](https://developer.apple.com/documentation/swift/array/collection-implementations)
[API Reference CustomDebugStringConvertible Implementations](https://developer.apple.com/documentation/swift/array/customdebugstringconvertible-implementations)
[API Reference CustomReflectable Implementations](https://developer.apple.com/documentation/swift/array/customreflectable-implementations)
[API Reference CustomStringConvertible Implementations](https://developer.apple.com/documentation/swift/array/customstringconvertible-implementations)
[API Reference Decodable Implementations](https://developer.apple.com/documentation/swift/array/decodable-implementations)
[API Reference Encodable Implementations](https://developer.apple.com/documentation/swift/array/encodable-implementations)
[API Reference Equatable Implementations](https://developer.apple.com/documentation/swift/array/equatable-implementations)
[API Reference ExpressibleByArrayLiteral Implementations](https://developer.apple.com/documentation/swift/array/expressiblebyarrayliteral-implementations)
[API Reference Hashable Implementations](https://developer.apple.com/documentation/swift/array/hashable-implementations)
[API Reference MutableCollection Implementations](https://developer.apple.com/documentation/swift/array/mutablecollection-implementations)
[API Reference OperationParameter Implementations](https://developer.apple.com/documentation/swift/array/operationparameter-implementations)
[API Reference RandomAccessCollection Implementations](https://developer.apple.com/documentation/swift/array/randomaccesscollection-implementations)
[API Reference RangeReplaceableCollection Implementations](https://developer.apple.com/documentation/swift/array/rangereplaceablecollection-implementations)
[API Reference Sequence Implementations](https://developer.apple.com/documentation/swift/array/sequence-implementations)
## [Relationships](https://developer.apple.com/documentation/Swift/Array#relationships)
### [Conforms To](https://developer.apple.com/documentation/Swift/Array#conforms-to)
  * [`AccelerateBuffer`](https://developer.apple.com/documentation/Accelerate/AccelerateBuffer)
  * [`AccelerateMutableBuffer`](https://developer.apple.com/documentation/Accelerate/AccelerateMutableBuffer)
  * [`AppExtensionScene`](https://developer.apple.com/documentation/ExtensionKit/AppExtensionScene)
  * [`Attachable`](https://developer.apple.com/documentation/Testing/Attachable)
  * [`BNNSGraph.Builder.OperationParameter`](https://developer.apple.com/documentation/Accelerate/BNNSGraph/Builder/OperationParameter)
  * [`BidirectionalCollection`](https://developer.apple.com/documentation/swift/bidirectionalcollection)
Conforms when `Element` conforms to `Copyable` and `Escapable`.
  * [`CKRecordValueProtocol`](https://developer.apple.com/documentation/CloudKit/CKRecordValueProtocol)
  * [`CMSampleBuffer.Content`](https://developer.apple.com/documentation/CoreMedia/CMSampleBuffer/Content)
  * [`CMSampleBuffer.ContentWithFormatDescription`](https://developer.apple.com/documentation/CoreMedia/CMSampleBuffer/ContentWithFormatDescription)
  * [`CVarArg`](https://developer.apple.com/documentation/swift/cvararg)
Conforms when `Element` conforms to `Copyable` and `Escapable`.
  * [`Collection`](https://developer.apple.com/documentation/swift/collection)
Conforms when `Element` conforms to `Copyable` and `Escapable`.
  * [`ContiguousBytes`](https://developer.apple.com/documentation/Foundation/ContiguousBytes)
  * [`ConvertibleFromGeneratedContent`](https://developer.apple.com/documentation/FoundationModels/ConvertibleFromGeneratedContent)
  * [`ConvertibleToGeneratedContent`](https://developer.apple.com/documentation/FoundationModels/ConvertibleToGeneratedContent)
  * [`Copyable`](https://developer.apple.com/documentation/swift/copyable)
Conforms when `Element` conforms to `Copyable` and `Escapable`.
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/swift/customdebugstringconvertible)
Conforms when `Element` conforms to `Copyable` and `Escapable`.
  * [`CustomReflectable`](https://developer.apple.com/documentation/swift/customreflectable)
Conforms when `Element` conforms to `Copyable` and `Escapable`.
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/swift/customstringconvertible)
Conforms when `Element` conforms to `Copyable` and `Escapable`.
  * [`DataProtocol`](https://developer.apple.com/documentation/Foundation/DataProtocol)
  * [`Decodable`](https://developer.apple.com/documentation/swift/decodable)
Conforms when `Element` conforms to `Decodable`.
  * [`DecodableWithConfiguration`](https://developer.apple.com/documentation/Foundation/DecodableWithConfiguration)
  * [`Encodable`](https://developer.apple.com/documentation/swift/encodable)
Conforms when `Element` conforms to `Encodable`.
  * [`EncodableWithConfiguration`](https://developer.apple.com/documentation/Foundation/EncodableWithConfiguration)
  * [`Equatable`](https://developer.apple.com/documentation/swift/equatable)
Conforms when `Element` conforms to `Equatable`.
  * [`ExpressibleByArrayLiteral`](https://developer.apple.com/documentation/swift/expressiblebyarrayliteral)
Conforms when `Element` conforms to `Copyable` and `Escapable`.
  * [`Generable`](https://developer.apple.com/documentation/FoundationModels/Generable)
  * [`Hashable`](https://developer.apple.com/documentation/swift/hashable)
Conforms when `Element` conforms to `Hashable`.
  * [`InstructionsRepresentable`](https://developer.apple.com/documentation/FoundationModels/InstructionsRepresentable)
  * [`MLDataValueConvertible`](https://developer.apple.com/documentation/CreateML/MLDataValueConvertible)
  * [`MutableCollection`](https://developer.apple.com/documentation/swift/mutablecollection)
Conforms when `Element` conforms to `Copyable` and `Escapable`.
  * [`MutableDataProtocol`](https://developer.apple.com/documentation/Foundation/MutableDataProtocol)
  * [`PositionScaleRange`](https://developer.apple.com/documentation/Charts/PositionScaleRange)
  * [`PromptRepresentable`](https://developer.apple.com/documentation/FoundationModels/PromptRepresentable)
  * [`RandomAccessCollection`](https://developer.apple.com/documentation/swift/randomaccesscollection)
Conforms when `Element` conforms to `Copyable` and `Escapable`.
  * [`RangeReplaceableCollection`](https://developer.apple.com/documentation/swift/rangereplaceablecollection)
Conforms when `Element` conforms to `Copyable` and `Escapable`.
  * [`RelationshipCollection`](https://developer.apple.com/documentation/SwiftData/RelationshipCollection)
  * [`ResultsCollection`](https://developer.apple.com/documentation/AppIntents/ResultsCollection)
  * [`ScaleDomain`](https://developer.apple.com/documentation/Charts/ScaleDomain)
  * [`ScaleRange`](https://developer.apple.com/documentation/Charts/ScaleRange)
  * [`Sendable`](https://developer.apple.com/documentation/swift/sendable)
Conforms when `Element` conforms to `Copyable`, `Escapable`, and `Sendable`.
  * [`SendableMetatype`](https://developer.apple.com/documentation/swift/sendablemetatype)
Conforms when `Element` conforms to `Copyable`, `Escapable`, and `Sendable`.
  * [`Sequence`](https://developer.apple.com/documentation/swift/sequence)
Conforms when `Element` conforms to `Copyable` and `Escapable`.


## [See Also](https://developer.apple.com/documentation/Swift/Array#see-also)
### [Standard Library](https://developer.apple.com/documentation/Swift/Array#Standard-Library)
[`struct Int`](https://developer.apple.com/documentation/swift/int)
A signed integer value type.
[`struct Double`](https://developer.apple.com/documentation/swift/double)
A double-precision, floating-point value type.
[`struct String`](https://developer.apple.com/documentation/swift/string)
A Unicode string value that is a collection of characters.
[`struct Dictionary`](https://developer.apple.com/documentation/swift/dictionary)
A collection whose elements are key-value pairs.
[API Reference Swift Standard Library](https://developer.apple.com/documentation/swift/swift-standard-library)
Solve complex problems and write high-performance, readable code.
Current page is Array 
[Apple](https://www.apple.com)
  1. [Developer](https://developer.apple.com/)
  2. [ Documentation ](https://developer.apple.com/documentation/)


###  Platforms 
Toggle Menu 
  * [iOS](https://developer.apple.com/ios/)
  * [iPadOS](https://developer.apple.com/ipados/)
  * [macOS](https://developer.apple.com/macos/)
  * [tvOS](https://developer.apple.com/tvos/)
  * [visionOS](https://developer.apple.com/visionos/)
  * [watchOS](https://developer.apple.com/watchos/)


###  Tools 
Toggle Menu 
  * [Swift](https://developer.apple.com/swift/)
  * [SwiftUI](https://developer.apple.com/swiftui/)
  * [Swift Playground](https://developer.apple.com/swift-playground/)
  * [TestFlight](https://developer.apple.com/testflight/)
  * [Xcode](https://developer.apple.com/xcode/)
  * [Xcode Cloud](https://developer.apple.com/xcode-cloud/)
  * [SF Symbols](https://developer.apple.com/sf-symbols/)


###  Topics & Technologies 
Toggle Menu 
  * [Accessibility](https://developer.apple.com/accessibility/)
  * [Accessories](https://developer.apple.com/accessories/)
  * [App Extension](https://developer.apple.com/app-extensions/)
  * [App Store](https://developer.apple.com/app-store/)
  * [Audio & Video](https://developer.apple.com/audio/)
  * [Augmented Reality](https://developer.apple.com/augmented-reality/)
  * [Design](https://developer.apple.com/design/)
  * [Distribution](https://developer.apple.com/distribute/)
  * [Education](https://developer.apple.com/education/)
  * [Fonts](https://developer.apple.com/fonts/)
  * [Games](https://developer.apple.com/games/)
  * [Health & Fitness](https://developer.apple.com/health-fitness/)
  * [In-App Purchase](https://developer.apple.com/in-app-purchase/)
  * [Localization](https://developer.apple.com/localization/)
  * [Maps & Location](https://developer.apple.com/maps/)
  * [Machine Learning & AI](https://developer.apple.com/machine-learning/)
  * [Open Source](https://opensource.apple.com/)
  * [Security](https://developer.apple.com/security/)
  * [Safari & Web](https://developer.apple.com/safari/)


###  Resources 
Toggle Menu 
  *   * [Documentation](https://developer.apple.com/documentation/)
  * [Tutorials](https://developer.apple.com/learn/)
  * [Downloads](https://developer.apple.com/download/)
  * [Forums](https://developer.apple.com/forums/)
  * [Videos](https://developer.apple.com/videos/)


###  Support 
Toggle Menu 
  * [Support Articles](https://developer.apple.com/support/articles/)
  * [Contact Us](https://developer.apple.com/contact/)
  * [Bug Reporting](https://developer.apple.com/bug-reporting/)
  * [System Status](https://developer.apple.com/system-status/)


###  Account 
Toggle Menu 
  * [Apple Developer](https://developer.apple.com/account/)
  * [App Store Connect](https://appstoreconnect.apple.com/)
  * [Certificates, IDs, & Profiles](https://developer.apple.com/account/ios/certificate/)
  * [Feedback Assistant](https://feedbackassistant.apple.com/)


###  Programs 
Toggle Menu 
  * [Apple Developer Program](https://developer.apple.com/programs/)
  * [Apple Developer Enterprise Program](https://developer.apple.com/programs/enterprise/)
  * [App Store Small Business Program](https://developer.apple.com/app-store/small-business-program/)
  * [MFi Program](https://mfi.apple.com/)
  * [News Partner Program](https://developer.apple.com/programs/news-partner/)
  * [Video Partner Program](https://developer.apple.com/programs/video-partner/)
  * [Security Bounty Program](https://developer.apple.com/security-bounty/)
  * [Security Research Device Program](https://developer.apple.com/programs/security-research-device/)


###  Events 
Toggle Menu 
  * [Meet with Apple](https://developer.apple.com/events/)
  * [Apple Developer Centers](https://developer.apple.com/events/developer-centers/)
  * [App Store Awards](https://developer.apple.com/app-store/app-store-awards/)
  * [Apple Design Awards](https://developer.apple.com/design/awards/)
  * [Apple Developer Academies](https://developer.apple.com/academies/)
  * [WWDC](https://developer.apple.com/wwdc/)


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FSwift%2FArray).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
