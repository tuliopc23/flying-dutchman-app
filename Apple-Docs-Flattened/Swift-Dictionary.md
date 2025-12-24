Source: https://developer.apple.com/documentation/Swift/Dictionary

[ Skip Navigation ](https://developer.apple.com/documentation/Swift/Dictionary#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/Swift/Dictionary#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/Swift/Dictionary)
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
[ Open Menu ](https://developer.apple.com/documentation/Swift/Dictionary)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/Swift/Dictionary)
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
S
9 of 36 symbols inside <root> containing 100 symbols[Dictionary](https://developer.apple.com/documentation/swift/dictionary)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 100 symbols inside 303646133 
Creating a Dictionary
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 100 symbols inside 303646133 [init()](https://developer.apple.com/documentation/swift/dictionary/init\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 100 symbols inside 303646133 [init(minimumCapacity: Int)](https://developer.apple.com/documentation/swift/dictionary/init\(minimumcapacity:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 100 symbols inside 303646133 [init<S>(uniqueKeysWithValues: S)](https://developer.apple.com/documentation/swift/dictionary/init\(uniquekeyswithvalues:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 100 symbols inside 303646133 [init<S>(S, uniquingKeysWith: (Value, Value) throws -> Value) rethrows](https://developer.apple.com/documentation/swift/dictionary/init\(_:uniquingkeyswith:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
6 of 100 symbols inside 303646133 [init<S>(grouping: S, by: (S.Element) throws -> Key) rethrows](https://developer.apple.com/documentation/swift/dictionary/init\(grouping:by:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
7 of 100 symbols inside 303646133 
Inspecting a Dictionary
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
8 of 100 symbols inside 303646133 [var isEmpty: Bool](https://developer.apple.com/documentation/swift/dictionary/isempty)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
P
9 of 100 symbols inside 303646133 [var count: Int](https://developer.apple.com/documentation/swift/dictionary/count)
136 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Swift ](https://developer.apple.com/documentation/swift)
  * [ Dictionary ](https://developer.apple.com/documentation/Swift/Dictionary)
  *     * Dictionary 


Structure
# Dictionary
A collection whose elements are key-value pairs.
iOS 8.0+iPadOS 8.0+Mac Catalyst 13.0+macOS 10.10+tvOS 9.0+visionOS 1.0+watchOS 2.0+
```
@frozen
struct Dictionary<Key, Value> where Key : [Hashable](https://developer.apple.com/documentation/swift/hashable)
```

## [Overview](https://developer.apple.com/documentation/Swift/Dictionary#overview)
A dictionary is a type of hash table, providing fast access to the entries it contains. Each entry in the table is identified using its key, which is a hashable type such as a string or number. You use that key to retrieve the corresponding value, which can be any object. In other languages, similar data types are known as hashes or associated arrays.
Create a new dictionary by using a dictionary literal. A dictionary literal is a comma-separated list of key-value pairs, in which a colon separates each key from its associated value, surrounded by square brackets. You can assign a dictionary literal to a variable or constant or pass it to a function that expects a dictionary.
Here’s how you would create a dictionary of HTTP response codes and their related messages:
```
var responseMessages = [200: "OK",
                        403: "Access forbidden",
                        404: "File not found",
                        500: "Internal server error"]

```

The `responseMessages` variable is inferred to have type `[Int: String]`. The `Key` type of the dictionary is `Int`, and the `Value` type of the dictionary is `String`.
To create a dictionary with no key-value pairs, use an empty dictionary literal (`[:]`).
```
var emptyDict: [String: String] = [:]

```

Any type that conforms to the `Hashable` protocol can be used as a dictionary’s `Key` type, including all of Swift’s basic types. You can use your own custom types as dictionary keys by making them conform to the `Hashable` protocol.
# [Getting and Setting Dictionary Values](https://developer.apple.com/documentation/Swift/Dictionary#Getting-and-Setting-Dictionary-Values)
The most common way to access values in a dictionary is to use a key as a subscript. Subscripting with a key takes the following form:
```
print(responseMessages[200])
// Prints "Optional("OK")"

```

Subscripting a dictionary with a key returns an optional value, because a dictionary might not hold a value for the key that you use in the subscript.
The next example uses key-based subscripting of the `responseMessages` dictionary with two keys that exist in the dictionary and one that does not.
```
let httpResponseCodes = [200, 403, 301]
for code in httpResponseCodes {
    if let message = responseMessages[code] {
        print("Response \(code): \(message)")
    } else {
        print("Unknown response \(code)")
    }
}
// Prints "Response 200: OK"
// Prints "Response 403: Access forbidden"
// Prints "Unknown response 301"

```

You can also update, modify, or remove keys and values from a dictionary using the key-based subscript. To add a new key-value pair, assign a value to a key that isn’t yet a part of the dictionary.
```
responseMessages[301] = "Moved permanently"
print(responseMessages[301])
// Prints "Optional("Moved permanently")"

```

Update an existing value by assigning a new value to a key that already exists in the dictionary. If you assign `nil` to an existing key, the key and its associated value are removed. The following example updates the value for the `404` code to be simply “Not found” and removes the key-value pair for the `500` code entirely.
```
responseMessages[404] = "Not found"
responseMessages[500] = nil
print(responseMessages)
// Prints "[301: "Moved permanently", 200: "OK", 403: "Access forbidden", 404: "Not found"]"

```

In a mutable `Dictionary` instance, you can modify in place a value that you’ve accessed through a keyed subscript. The code sample below declares a dictionary called `interestingNumbers` with string keys and values that are integer arrays, then sorts each array in-place in descending order.
```
var interestingNumbers = ["primes": [2, 3, 5, 7, 11, 13, 17],
                          "triangular": [1, 3, 6, 10, 15, 21, 28],
                          "hexagonal": [1, 6, 15, 28, 45, 66, 91]]
for key in interestingNumbers.keys {
    interestingNumbers[key]?.sort(by: >)
}


print(interestingNumbers["primes"]!)
// Prints "[17, 13, 11, 7, 5, 3, 2]"

```

# [Iterating Over the Contents of a Dictionary](https://developer.apple.com/documentation/Swift/Dictionary#Iterating-Over-the-Contents-of-a-Dictionary)
Every dictionary is an unordered collection of key-value pairs. You can iterate over a dictionary using a `for`-`in` loop, decomposing each key-value pair into the elements of a tuple.
```
let imagePaths = ["star": "/glyphs/star.png",
                  "portrait": "/images/content/portrait.jpg",
                  "spacer": "/images/shared/spacer.gif"]


for (name, path) in imagePaths {
    print("The path to '\(name)' is '\(path)'.")
}
// Prints "The path to 'star' is '/glyphs/star.png'."
// Prints "The path to 'portrait' is '/images/content/portrait.jpg'."
// Prints "The path to 'spacer' is '/images/shared/spacer.gif'."

```

The order of key-value pairs in a dictionary is stable between mutations but is otherwise unpredictable. If you need an ordered collection of key-value pairs and don’t need the fast key lookup that `Dictionary` provides, see the `KeyValuePairs` type for an alternative.
You can search a dictionary’s contents for a particular value using the `contains(where:)` or `firstIndex(where:)` methods supplied by default implementation. The following example checks to see if `imagePaths` contains any paths in the `"/glyphs"` directory:
```
let glyphIndex = imagePaths.firstIndex(where: { $0.value.hasPrefix("/glyphs") })
if let index = glyphIndex {
    print("The '\(imagePaths[index].key)' image is a glyph.")
} else {
    print("No glyphs found!")
}
// Prints "The 'star' image is a glyph."

```

Note that in this example, `imagePaths` is subscripted using a dictionary index. Unlike the key-based subscript, the index-based subscript returns the corresponding key-value pair as a non-optional tuple.
```
print(imagePaths[glyphIndex!])
// Prints "(key: "star", value: "/glyphs/star.png")"

```

A dictionary’s indices stay valid across additions to the dictionary as long as the dictionary has enough capacity to store the added values without allocating more buffer. When a dictionary outgrows its buffer, existing indices may be invalidated without any notification.
When you know how many new values you’re adding to a dictionary, use the `init(minimumCapacity:)` initializer to allocate the correct amount of buffer.
# [Bridging Between Dictionary and NSDictionary](https://developer.apple.com/documentation/Swift/Dictionary#Bridging-Between-Dictionary-and-NSDictionary)
You can bridge between `Dictionary` and `NSDictionary` using the `as` operator. For bridging to be possible, the `Key` and `Value` types of a dictionary must be classes, `@objc` protocols, or types that bridge to Foundation types.
Bridging from `Dictionary` to `NSDictionary` always takes O(1) time and space. When the dictionary’s `Key` and `Value` types are neither classes nor `@objc` protocols, any required bridging of elements occurs at the first access of each element. For this reason, the first operation that uses the contents of the dictionary may take O(_n_).
Bridging from `NSDictionary` to `Dictionary` first calls the `copy(with:)` method (`- copyWithZone:` in Objective-C) on the dictionary to get an immutable copy and then performs additional Swift bookkeeping work that takes O(1) time. For instances of `NSDictionary` that are already immutable, `copy(with:)` usually returns the same dictionary in O(1) time; otherwise, the copying performance is unspecified. The instances of `NSDictionary` and `Dictionary` share buffer using the same copy-on-write optimization that is used when two instances of `Dictionary` share buffer.
## [Topics](https://developer.apple.com/documentation/Swift/Dictionary#topics)
### [Creating a Dictionary](https://developer.apple.com/documentation/Swift/Dictionary#Creating-a-Dictionary)
In addition to using a dictionary literal, you can also create a dictionary using these initializers.
[`init()`](https://developer.apple.com/documentation/swift/dictionary/init\(\))
Creates an empty dictionary.
[`init(minimumCapacity: Int)`](https://developer.apple.com/documentation/swift/dictionary/init\(minimumcapacity:\))
Creates an empty dictionary with preallocated space for at least the specified number of elements.
[`init<S>(uniqueKeysWithValues: S)`](https://developer.apple.com/documentation/swift/dictionary/init\(uniquekeyswithvalues:\))
Creates a new dictionary from the key-value pairs in the given sequence.
[`init<S>(S, uniquingKeysWith: (Value, Value) throws -> Value) rethrows`](https://developer.apple.com/documentation/swift/dictionary/init\(_:uniquingkeyswith:\))
Creates a new dictionary from the key-value pairs in the given sequence, using a combining closure to determine the value for any duplicate keys.
[`init<S>(grouping: S, by: (S.Element) throws -> Key) rethrows`](https://developer.apple.com/documentation/swift/dictionary/init\(grouping:by:\))
Creates a new dictionary whose keys are the groupings returned by the given closure and whose values are arrays of the elements that returned each key.
### [Inspecting a Dictionary](https://developer.apple.com/documentation/Swift/Dictionary#Inspecting-a-Dictionary)
[`var isEmpty: Bool`](https://developer.apple.com/documentation/swift/dictionary/isempty)
A Boolean value that indicates whether the dictionary is empty.
[`var count: Int`](https://developer.apple.com/documentation/swift/dictionary/count)
The number of key-value pairs in the dictionary.
[`var capacity: Int`](https://developer.apple.com/documentation/swift/dictionary/capacity)
The total number of key-value pairs that the dictionary can contain without allocating new storage.
### [Accessing Keys and Values](https://developer.apple.com/documentation/Swift/Dictionary#Accessing-Keys-and-Values)
[`subscript(Key) -> Value?`](https://developer.apple.com/documentation/swift/dictionary/subscript\(_:\)-8rfql)
Accesses the value associated with the given key for reading and writing.
[`subscript(Key, default _: @autoclosure () -> Value) -> Value`](https://developer.apple.com/documentation/swift/dictionary/subscript\(_:default:\))
Accesses the value with the given key, falling back to the given default value if the key isn’t found.
[`func index(forKey: Key) -> Dictionary<Key, Value>.Index?`](https://developer.apple.com/documentation/swift/dictionary/index\(forkey:\))
Returns the index for the given key.
[`subscript(Dictionary<Key, Value>.Index) -> Dictionary<Key, Value>.Element`](https://developer.apple.com/documentation/swift/dictionary/subscript\(_:\)-4bhoo)
Accesses the key-value pair at the specified position.
[`var keys: Dictionary<Key, Value>.Keys`](https://developer.apple.com/documentation/swift/dictionary/keys-swift.property)
A collection containing just the keys of the dictionary.
[`var values: Dictionary<Key, Value>.Values`](https://developer.apple.com/documentation/swift/dictionary/values-swift.property)
A collection containing just the values of the dictionary.
[`var first: Self.Element?`](https://developer.apple.com/documentation/swift/dictionary/first)
The first element of the collection.
[`func randomElement() -> Self.Element?`](https://developer.apple.com/documentation/swift/dictionary/randomelement\(\))
Returns a random element of the collection.
[`func randomElement<T>(using: inout T) -> Self.Element?`](https://developer.apple.com/documentation/swift/dictionary/randomelement\(using:\))
Returns a random element of the collection, using the given generator as a source for randomness.
### [Adding Keys and Values](https://developer.apple.com/documentation/Swift/Dictionary#Adding-Keys-and-Values)
[`func updateValue(Value, forKey: Key) -> Value?`](https://developer.apple.com/documentation/swift/dictionary/updatevalue\(_:forkey:\))
Updates the value stored in the dictionary for the given key, or adds a new key-value pair if the key does not exist.
[`func merge([Key : Value], uniquingKeysWith: (Value, Value) throws -> Value) rethrows`](https://developer.apple.com/documentation/swift/dictionary/merge\(_:uniquingkeyswith:\)-m2ub)
Merges the given dictionary into this dictionary, using a combining closure to determine the value for any duplicate keys.
[`func merge<S>(S, uniquingKeysWith: (Value, Value) throws -> Value) rethrows`](https://developer.apple.com/documentation/swift/dictionary/merge\(_:uniquingkeyswith:\)-7smbb)
Merges the key-value pairs in the given sequence into the dictionary, using a combining closure to determine the value for any duplicate keys.
[`func merging([Key : Value], uniquingKeysWith: (Value, Value) throws -> Value) rethrows -> [Key : Value]`](https://developer.apple.com/documentation/swift/dictionary/merging\(_:uniquingkeyswith:\)-3vtfs)
Creates a dictionary by merging the given dictionary into this dictionary, using a combining closure to determine the value for duplicate keys.
[`func merging<S>(S, uniquingKeysWith: (Value, Value) throws -> Value) rethrows -> [Key : Value]`](https://developer.apple.com/documentation/swift/dictionary/merging\(_:uniquingkeyswith:\)-9bik6)
Creates a dictionary by merging key-value pairs in a sequence into the dictionary, using a combining closure to determine the value for duplicate keys.
[`func reserveCapacity(Int)`](https://developer.apple.com/documentation/swift/dictionary/reservecapacity\(_:\))
Reserves enough space to store the specified number of key-value pairs.
### [Removing Keys and Values](https://developer.apple.com/documentation/Swift/Dictionary#Removing-Keys-and-Values)
[`func filter((Dictionary<Key, Value>.Element) throws -> Bool) rethrows -> [Key : Value]`](https://developer.apple.com/documentation/swift/dictionary/filter\(_:\))
Returns a new dictionary containing the key-value pairs of the dictionary that satisfy the given predicate.
[`func removeValue(forKey: Key) -> Value?`](https://developer.apple.com/documentation/swift/dictionary/removevalue\(forkey:\))
Removes the given key and its associated value from the dictionary.
[`func remove(at: Dictionary<Key, Value>.Index) -> Dictionary<Key, Value>.Element`](https://developer.apple.com/documentation/swift/dictionary/remove\(at:\))
Removes and returns the key-value pair at the specified index.
[`func removeAll(keepingCapacity: Bool)`](https://developer.apple.com/documentation/swift/dictionary/removeall\(keepingcapacity:\))
Removes all key-value pairs from the dictionary.
### [Comparing Dictionaries](https://developer.apple.com/documentation/Swift/Dictionary#Comparing-Dictionaries)
[`static func == ([Key : Value], [Key : Value]) -> Bool`](https://developer.apple.com/documentation/swift/dictionary/==\(_:_:\))
Returns a Boolean value indicating whether two values are equal.
[`static func != (Self, Self) -> Bool`](https://developer.apple.com/documentation/swift/dictionary/!=\(_:_:\))
Returns a Boolean value indicating whether two values are not equal.
### [Iterating over Keys and Values](https://developer.apple.com/documentation/Swift/Dictionary#Iterating-over-Keys-and-Values)
[`func forEach((Self.Element) throws -> Void) rethrows`](https://developer.apple.com/documentation/swift/dictionary/foreach\(_:\))
Calls the given closure on each element in the sequence in the same order as a `for`-`in` loop.
[`func enumerated() -> EnumeratedSequence<Self>`](https://developer.apple.com/documentation/swift/dictionary/enumerated\(\))
Returns a sequence of pairs (_n_ , _x_), where _n_ represents a consecutive integer starting at zero and _x_ represents an element of the sequence.
[`var lazy: LazySequence<Self>`](https://developer.apple.com/documentation/swift/dictionary/lazy)
A sequence containing the same elements as this sequence, but on which some operations, such as `map` and `filter`, are implemented lazily.
[`func makeIterator() -> Dictionary<Key, Value>.Iterator`](https://developer.apple.com/documentation/swift/dictionary/makeiterator\(\))
Returns an iterator over the dictionary’s key-value pairs.
[`var underestimatedCount: Int`](https://developer.apple.com/documentation/swift/dictionary/underestimatedcount)
A value less than or equal to the number of elements in the collection.
### [Finding Elements](https://developer.apple.com/documentation/Swift/Dictionary#Finding-Elements)
[`func contains(where: (Self.Element) throws -> Bool) rethrows -> Bool`](https://developer.apple.com/documentation/swift/dictionary/contains\(where:\))
Returns a Boolean value indicating whether the sequence contains an element that satisfies the given predicate.
[`func allSatisfy((Self.Element) throws -> Bool) rethrows -> Bool`](https://developer.apple.com/documentation/swift/dictionary/allsatisfy\(_:\))
Returns a Boolean value indicating whether every element of a sequence satisfies a given predicate.
[`func first(where: (Self.Element) throws -> Bool) rethrows -> Self.Element?`](https://developer.apple.com/documentation/swift/dictionary/first\(where:\))
Returns the first element of the sequence that satisfies the given predicate.
[`func firstIndex(where: (Self.Element) throws -> Bool) rethrows -> Self.Index?`](https://developer.apple.com/documentation/swift/dictionary/firstindex\(where:\))
Returns the first index in which an element of the collection satisfies the given predicate.
[`func min(by: (Self.Element, Self.Element) throws -> Bool) rethrows -> Self.Element?`](https://developer.apple.com/documentation/swift/dictionary/min\(by:\))
Returns the minimum element in the sequence, using the given predicate as the comparison between elements.
[`func max(by: (Self.Element, Self.Element) throws -> Bool) rethrows -> Self.Element?`](https://developer.apple.com/documentation/swift/dictionary/max\(by:\))
Returns the maximum element in the sequence, using the given predicate as the comparison between elements.
### [Transforming a Dictionary](https://developer.apple.com/documentation/Swift/Dictionary#Transforming-a-Dictionary)
[`func mapValues<T>((Value) throws -> T) rethrows -> Dictionary<Key, T>`](https://developer.apple.com/documentation/swift/dictionary/mapvalues\(_:\))
Returns a new dictionary containing the keys of this dictionary with the values transformed by the given closure.
[`func reduce<Result>(Result, (Result, Self.Element) throws -> Result) rethrows -> Result`](https://developer.apple.com/documentation/swift/dictionary/reduce\(_:_:\))
Returns the result of combining the elements of the sequence using the given closure.
[`func reduce<Result>(into: Result, (inout Result, Self.Element) throws -> ()) rethrows -> Result`](https://developer.apple.com/documentation/swift/dictionary/reduce\(into:_:\))
Returns the result of combining the elements of the sequence using the given closure.
[`func compactMap<ElementOfResult>((Self.Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult]`](https://developer.apple.com/documentation/swift/dictionary/compactmap\(_:\))
Returns an array containing the non-`nil` results of calling the given transformation with each element of this sequence.
[`func compactMapValues<T>((Value) throws -> T?) rethrows -> Dictionary<Key, T>`](https://developer.apple.com/documentation/swift/dictionary/compactmapvalues\(_:\))
Returns a new dictionary containing only the key-value pairs that have non-`nil` values as the result of transformation by the given closure.
[`func flatMap<SegmentOfResult>((Self.Element) throws -> SegmentOfResult) rethrows -> [SegmentOfResult.Element]`](https://developer.apple.com/documentation/swift/dictionary/flatmap\(_:\)-i3ly)
Returns an array containing the concatenated results of calling the given transformation with each element of this sequence.
[`func flatMap<ElementOfResult>((Self.Element) throws -> ElementOfResult?) rethrows -> [ElementOfResult]`](https://developer.apple.com/documentation/swift/dictionary/flatmap\(_:\)-6chv9)
[`func sorted(by: (Self.Element, Self.Element) throws -> Bool) rethrows -> [Self.Element]`](https://developer.apple.com/documentation/swift/dictionary/sorted\(by:\))
Returns the elements of the sequence, sorted using the given predicate as the comparison between elements.
[`func shuffled() -> [Self.Element]`](https://developer.apple.com/documentation/swift/dictionary/shuffled\(\))
Returns the elements of the sequence, shuffled.
[`func shuffled<T>(using: inout T) -> [Self.Element]`](https://developer.apple.com/documentation/swift/dictionary/shuffled\(using:\))
Returns the elements of the sequence, shuffled using the given generator as a source for randomness.
### [Performing Collection Operations](https://developer.apple.com/documentation/Swift/Dictionary#Performing-Collection-Operations)
[API Reference Order Dependent Operations on Dictionary](https://developer.apple.com/documentation/swift/order-dependent-operations-on-dictionary)
Perform order-dependent operations common to all collections, as implemented for `Dictionary`.
### [Encoding and Decoding](https://developer.apple.com/documentation/Swift/Dictionary#Encoding-and-Decoding)
[`func encode(to: any Encoder) throws`](https://developer.apple.com/documentation/swift/dictionary/encode\(to:\))
Encodes the contents of this dictionary into the given encoder.
[`init(from: any Decoder) throws`](https://developer.apple.com/documentation/swift/dictionary/init\(from:\)-6e6js)
Creates a new dictionary by decoding from the given decoder.
### [Describing a Dictionary](https://developer.apple.com/documentation/Swift/Dictionary#Describing-a-Dictionary)
[`var description: String`](https://developer.apple.com/documentation/swift/dictionary/description)
A string that represents the contents of the dictionary.
[`var debugDescription: String`](https://developer.apple.com/documentation/swift/dictionary/debugdescription)
A string that represents the contents of the dictionary, suitable for debugging.
[`var customMirror: Mirror`](https://developer.apple.com/documentation/swift/dictionary/custommirror)
A mirror that reflects the dictionary.
[`func hash(into: inout Hasher)`](https://developer.apple.com/documentation/swift/dictionary/hash\(into:\))
Hashes the essential components of this value by feeding them into the given hasher.
### [Using a Dictionary as a Data Value](https://developer.apple.com/documentation/Swift/Dictionary#Using-a-Dictionary-as-a-Data-Value)
[`init?(from: MLDataValue.DictionaryType)`](https://developer.apple.com/documentation/swift/dictionary/init\(from:\)-5zhfu)
### [Reference Types](https://developer.apple.com/documentation/Swift/Dictionary#Reference-Types)
Use bridged reference types when you need reference semantics or Foundation-specific behavior.
[`class NSDictionary`](https://developer.apple.com/documentation/Foundation/NSDictionary)
A static collection of objects associated with unique keys.
[`class NSMutableDictionary`](https://developer.apple.com/documentation/Foundation/NSMutableDictionary)
A dynamic collection of objects associated with unique keys.
### [Supporting Types](https://developer.apple.com/documentation/Swift/Dictionary#Supporting-Types)
[`struct Keys`](https://developer.apple.com/documentation/swift/dictionary/keys-swift.struct)
A view of a dictionary’s keys.
[`struct Values`](https://developer.apple.com/documentation/swift/dictionary/values-swift.struct)
A view of a dictionary’s values.
[`struct Index`](https://developer.apple.com/documentation/swift/dictionary/index)
The position of a key-value pair in a dictionary.
[`typealias Indices`](https://developer.apple.com/documentation/swift/dictionary/indices)
A type that represents the indices that are valid for subscripting the collection, in ascending order.
[`struct Iterator`](https://developer.apple.com/documentation/swift/dictionary/iterator)
An iterator over the members of a `Dictionary<Key, Value>`.
### [Creating a Dictionary from an Attribute Container](https://developer.apple.com/documentation/Swift/Dictionary#Creating-a-Dictionary-from-an-Attribute-Container)
[`init<S>(AttributeContainer, including: S.Type) throws`](https://developer.apple.com/documentation/swift/dictionary/init\(_:including:\)-7afz2)
[`init<S>(AttributeContainer, including: KeyPath<AttributeScopes, S.Type>) throws`](https://developer.apple.com/documentation/swift/dictionary/init\(_:including:\)-8ls7v)
[`init(AttributeContainer)`](https://developer.apple.com/documentation/swift/dictionary/init\(_:\))
### [Infrequently Used Functionality](https://developer.apple.com/documentation/Swift/Dictionary#Infrequently-Used-Functionality)
[`init(dictionaryLiteral: (Key, Value)...)`](https://developer.apple.com/documentation/swift/dictionary/init\(dictionaryliteral:\))
Creates a dictionary initialized with a dictionary literal.
[`var hashValue: Int`](https://developer.apple.com/documentation/swift/dictionary/hashvalue)
The hash value.
### [Type Aliases](https://developer.apple.com/documentation/Swift/Dictionary#Type-Aliases)
[`typealias Element`](https://developer.apple.com/documentation/swift/dictionary/element)
The element type of a dictionary: a tuple containing an individual key-value pair.
### [Default Implementations](https://developer.apple.com/documentation/Swift/Dictionary#Default-Implementations)
[API Reference Collection Implementations](https://developer.apple.com/documentation/swift/dictionary/collection-implementations)
[API Reference CustomDebugStringConvertible Implementations](https://developer.apple.com/documentation/swift/dictionary/customdebugstringconvertible-implementations)
[API Reference CustomReflectable Implementations](https://developer.apple.com/documentation/swift/dictionary/customreflectable-implementations)
[API Reference CustomStringConvertible Implementations](https://developer.apple.com/documentation/swift/dictionary/customstringconvertible-implementations)
[API Reference Decodable Implementations](https://developer.apple.com/documentation/swift/dictionary/decodable-implementations)
[API Reference Encodable Implementations](https://developer.apple.com/documentation/swift/dictionary/encodable-implementations)
[API Reference Equatable Implementations](https://developer.apple.com/documentation/swift/dictionary/equatable-implementations)
[API Reference ExpressibleByDictionaryLiteral Implementations](https://developer.apple.com/documentation/swift/dictionary/expressiblebydictionaryliteral-implementations)
[API Reference Hashable Implementations](https://developer.apple.com/documentation/swift/dictionary/hashable-implementations)
[API Reference Sequence Implementations](https://developer.apple.com/documentation/swift/dictionary/sequence-implementations)
## [Relationships](https://developer.apple.com/documentation/Swift/Dictionary#relationships)
### [Conforms To](https://developer.apple.com/documentation/Swift/Dictionary#conforms-to)
  * [`CVarArg`](https://developer.apple.com/documentation/swift/cvararg)
Conforms when `Key` conforms to `Hashable`, `Value` conforms to `Copyable`, and `Value` conforms to `Escapable`.
  * [`Collection`](https://developer.apple.com/documentation/swift/collection)
Conforms when `Key` conforms to `Hashable`, `Value` conforms to `Copyable`, and `Value` conforms to `Escapable`.
  * [`Copyable`](https://developer.apple.com/documentation/swift/copyable)
Conforms when `Key` conforms to `Encodable`, `Key` conforms to `Hashable`, and `Value` conforms to `Encodable`.
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/swift/customdebugstringconvertible)
Conforms when `Key` conforms to `Hashable`, `Value` conforms to `Copyable`, and `Value` conforms to `Escapable`.
  * [`CustomReflectable`](https://developer.apple.com/documentation/swift/customreflectable)
Conforms when `Key` conforms to `Hashable`, `Value` conforms to `Copyable`, and `Value` conforms to `Escapable`.
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/swift/customstringconvertible)
Conforms when `Key` conforms to `Hashable`, `Value` conforms to `Copyable`, and `Value` conforms to `Escapable`.
  * [`Decodable`](https://developer.apple.com/documentation/swift/decodable)
Conforms when `Key` conforms to `Decodable`, `Key` conforms to `Hashable`, and `Value` conforms to `Decodable`.
  * [`Encodable`](https://developer.apple.com/documentation/swift/encodable)
Conforms when `Key` conforms to `Encodable`, `Key` conforms to `Hashable`, and `Value` conforms to `Encodable`.
  * [`Equatable`](https://developer.apple.com/documentation/swift/equatable)
Conforms when `Key` conforms to `Hashable` and `Value` conforms to `Equatable`.
  * [`ExpressibleByDictionaryLiteral`](https://developer.apple.com/documentation/swift/expressiblebydictionaryliteral)
Conforms when `Key` conforms to `Hashable`, `Value` conforms to `Copyable`, and `Value` conforms to `Escapable`.
  * [`Hashable`](https://developer.apple.com/documentation/swift/hashable)
Conforms when `Key` conforms to `Hashable` and `Value` conforms to `Hashable`.
  * [`MLDataValueConvertible`](https://developer.apple.com/documentation/CreateML/MLDataValueConvertible)
  * [`Sendable`](https://developer.apple.com/documentation/swift/sendable)
Conforms when `Key` conforms to `Hashable`, `Key` conforms to `Sendable`, `Value` conforms to `Copyable`, `Value` conforms to `Escapable`, and `Value` conforms to `Sendable`.
  * [`SendableMetatype`](https://developer.apple.com/documentation/swift/sendablemetatype)
Conforms when `Key` conforms to `Hashable`, `Key` conforms to `Sendable`, `Value` conforms to `Copyable`, `Value` conforms to `Escapable`, and `Value` conforms to `Sendable`.
  * [`Sequence`](https://developer.apple.com/documentation/swift/sequence)
Conforms when `Key` conforms to `Hashable`, `Value` conforms to `Copyable`, and `Value` conforms to `Escapable`.


## [See Also](https://developer.apple.com/documentation/Swift/Dictionary#see-also)
### [Standard Library](https://developer.apple.com/documentation/Swift/Dictionary#Standard-Library)
[`struct Int`](https://developer.apple.com/documentation/swift/int)
A signed integer value type.
[`struct Double`](https://developer.apple.com/documentation/swift/double)
A double-precision, floating-point value type.
[`struct String`](https://developer.apple.com/documentation/swift/string)
A Unicode string value that is a collection of characters.
[`struct Array`](https://developer.apple.com/documentation/swift/array)
An ordered, random-access collection.
[API Reference Swift Standard Library](https://developer.apple.com/documentation/swift/swift-standard-library)
Solve complex problems and write high-performance, readable code.
Current page is Dictionary 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FSwift%2FDictionary).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
