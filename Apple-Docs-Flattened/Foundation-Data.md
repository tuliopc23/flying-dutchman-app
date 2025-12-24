Source: https://developer.apple.com/documentation/Foundation/Data

[ Skip Navigation ](https://developer.apple.com/documentation/Foundation/Data#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/Foundation/Data#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/Foundation/Data)
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
[ Open Menu ](https://developer.apple.com/documentation/Foundation/Data)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/Foundation/Data)
## [ Foundation  ](https://developer.apple.com/documentation/foundation)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 64 symbols inside <root>
Fundamentals
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 64 symbols inside <root>
Fundamentals
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
2 of 64 symbols inside <root> containing 25 symbols[Numbers, Data, and Basic Values](https://developer.apple.com/documentation/foundation/numbers-data-and-basic-values)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 25 symbols inside -1192674281 
Numbers
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
2 of 25 symbols inside -1192674281 [Int](https://developer.apple.com/documentation/swift/int)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
3 of 25 symbols inside -1192674281 [Double](https://developer.apple.com/documentation/swift/double)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
4 of 25 symbols inside -1192674281 containing 97 symbols[Decimal](https://developer.apple.com/documentation/foundation/decimal)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
C
5 of 25 symbols inside -1192674281 containing 95 symbols[NumberFormatter](https://developer.apple.com/documentation/foundation/numberformatter)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 25 symbols inside -1192674281 
Binary Data
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
S
7 of 25 symbols inside -1192674281 containing 91 symbols[Data](https://developer.apple.com/documentation/foundation/data)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 91 symbols inside -217527208 
Creating Empty Data
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
2 of 91 symbols inside -217527208 [init()](https://developer.apple.com/documentation/foundation/data/init\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
3 of 91 symbols inside -217527208 [init(capacity: Int)](https://developer.apple.com/documentation/foundation/data/init\(capacity:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
4 of 91 symbols inside -217527208 [init(count: Int)](https://developer.apple.com/documentation/foundation/data/init\(count:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 91 symbols inside -217527208 [func resetBytes(in: Range<Data.Index>)](https://developer.apple.com/documentation/foundation/data/resetbytes\(in:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
6 of 91 symbols inside -217527208 
Creating Populated Data
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 91 symbols inside -217527208 [init()](https://developer.apple.com/documentation/foundation/data/init\(\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
8 of 91 symbols inside -217527208 [init<SourceType>(buffer: UnsafeBufferPointer<SourceType>)](https://developer.apple.com/documentation/foundation/data/init\(buffer:\)-75sng)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 91 symbols inside -217527208 [init<SourceType>(buffer: UnsafeMutableBufferPointer<SourceType>)](https://developer.apple.com/documentation/foundation/data/init\(buffer:\)-6xgv4)
180 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Foundation ](https://developer.apple.com/documentation/foundation)
  * [ Data ](https://developer.apple.com/documentation/Foundation/Data)
  *     * Data 


Structure
# Data
A byte buffer in memory.
iOS 8.0+iPadOS 8.0+Mac Catalyst 8.0+macOS 10.10+tvOS 9.0+visionOS 1.0+watchOS 2.0+
```
@frozen
struct Data
```

## [ Mentioned in ](https://developer.apple.com/documentation/Foundation/Data#mentions)
[](https://developer.apple.com/documentation/foundation/processing-url-session-data-task-results-with-combine)
[](https://developer.apple.com/documentation/foundation/encoding-and-decoding-custom-types)
## [Overview](https://developer.apple.com/documentation/Foundation/Data#overview)
The [`Data`](https://developer.apple.com/documentation/foundation/data) value type allows simple byte buffers to take on the behavior of Foundation objects. You can create empty or pre-populated buffers from a variety of sources and later add or remove bytes. You can filter and sort the content, or compare against other buffers. You can manipulate subranges of bytes and iterate over some or all of them.
[`Data`](https://developer.apple.com/documentation/foundation/data) bridges to the [`NSData`](https://developer.apple.com/documentation/foundation/nsdata) class and its mutable subclass, [`NSMutableData`](https://developer.apple.com/documentation/foundation/nsmutabledata). You can use these interchangeably in code that interacts with Objective-C APIs.
## [Topics](https://developer.apple.com/documentation/Foundation/Data#topics)
### [Creating Empty Data](https://developer.apple.com/documentation/Foundation/Data#Creating-Empty-Data)
[`init()`](https://developer.apple.com/documentation/foundation/data/init\(\))
Creates an empty data buffer.
[`init(capacity: Int)`](https://developer.apple.com/documentation/foundation/data/init\(capacity:\))
Creates an empty data buffer of a specified size.
[`init(count: Int)`](https://developer.apple.com/documentation/foundation/data/init\(count:\))
Creates a new data buffer with the specified count of zeroed bytes.
[`func resetBytes(in: Range<Data.Index>)`](https://developer.apple.com/documentation/foundation/data/resetbytes\(in:\))
Sets a region of the data buffer to `0`.
### [Creating Populated Data](https://developer.apple.com/documentation/Foundation/Data#Creating-Populated-Data)
[`init()`](https://developer.apple.com/documentation/foundation/data/init\(\))
Creates an empty data buffer.
[`init<SourceType>(buffer: UnsafeBufferPointer<SourceType>)`](https://developer.apple.com/documentation/foundation/data/init\(buffer:\)-75sng)
Creates a data buffer with copied memory content using a buffer pointer.
[`init<SourceType>(buffer: UnsafeMutableBufferPointer<SourceType>)`](https://developer.apple.com/documentation/foundation/data/init\(buffer:\)-6xgv4)
Creates a data buffer with copied memory content using a mutable buffer pointer.
[`init(bytes: UnsafeRawPointer, count: Int)`](https://developer.apple.com/documentation/foundation/data/init\(bytes:count:\))
Creates data with copied memory content.
[`init(bytesNoCopy: UnsafeMutableRawPointer, count: Int, deallocator: Data.Deallocator)`](https://developer.apple.com/documentation/foundation/data/init\(bytesnocopy:count:deallocator:\))
Creates a data buffer with memory content without copying the bytes.
[`init(capacity: Int)`](https://developer.apple.com/documentation/foundation/data/init\(capacity:\))
Creates an empty data buffer of a specified size.
[`init(count: Int)`](https://developer.apple.com/documentation/foundation/data/init\(count:\))
Creates a new data buffer with the specified count of zeroed bytes.
### [Creating Data from Raw Memory](https://developer.apple.com/documentation/Foundation/Data#Creating-Data-from-Raw-Memory)
[`init(bytes: UnsafeRawPointer, count: Int)`](https://developer.apple.com/documentation/foundation/data/init\(bytes:count:\))
Creates data with copied memory content.
[`init<SourceType>(buffer: UnsafeBufferPointer<SourceType>)`](https://developer.apple.com/documentation/foundation/data/init\(buffer:\)-75sng)
Creates a data buffer with copied memory content using a buffer pointer.
[`init<SourceType>(buffer: UnsafeMutableBufferPointer<SourceType>)`](https://developer.apple.com/documentation/foundation/data/init\(buffer:\)-6xgv4)
Creates a data buffer with copied memory content using a mutable buffer pointer.
[`init(bytesNoCopy: UnsafeMutableRawPointer, count: Int, deallocator: Data.Deallocator)`](https://developer.apple.com/documentation/foundation/data/init\(bytesnocopy:count:deallocator:\))
Creates a data buffer with memory content without copying the bytes.
[`enum Deallocator`](https://developer.apple.com/documentation/foundation/data/deallocator)
A deallocator you use to customize how the backing store is deallocated for data created with the no-copy initializer.
### [Reading and Writing Data](https://developer.apple.com/documentation/Foundation/Data#Reading-and-Writing-Data)
[`func write(to: URL, options: Data.WritingOptions) throws`](https://developer.apple.com/documentation/foundation/data/write\(to:options:\))
Writes the contents of the data buffer to a location.
[`typealias ReadingOptions`](https://developer.apple.com/documentation/foundation/data/readingoptions)
Options to control the reading of data from a URL.
[`typealias WritingOptions`](https://developer.apple.com/documentation/foundation/data/writingoptions)
Options to control the writing of data to a URL.
### [Base-64 Encoding](https://developer.apple.com/documentation/Foundation/Data#Base-64-Encoding)
[`func base64EncodedData(options: Data.Base64EncodingOptions) -> Data`](https://developer.apple.com/documentation/foundation/data/base64encodeddata\(options:\))
Returns Base-64 encoded data.
[`func base64EncodedString(options: Data.Base64EncodingOptions) -> String`](https://developer.apple.com/documentation/foundation/data/base64encodedstring\(options:\))
Returns a Base-64 encoded string.
[`typealias Base64DecodingOptions`](https://developer.apple.com/documentation/foundation/data/base64decodingoptions)
Options to use when decoding data.
[`typealias Base64EncodingOptions`](https://developer.apple.com/documentation/foundation/data/base64encodingoptions)
Options to use when encoding data.
### [Accessing Bytes](https://developer.apple.com/documentation/Foundation/Data#Accessing-Bytes)
[`subscript(Data.Index) -> UInt8`](https://developer.apple.com/documentation/foundation/data/subscript\(_:\)-8kg64)
Accesses the byte at the specified index.
### [Accessing Underlying Memory](https://developer.apple.com/documentation/Foundation/Data#Accessing-Underlying-Memory)
[`func withUnsafeBytes<ResultType, ContentType>((UnsafePointer<ContentType>) throws -> ResultType) rethrows -> ResultType`](https://developer.apple.com/documentation/foundation/data/withunsafebytes\(_:\))
Accesses the raw bytes in the data’s buffer.
[`func withUnsafeMutableBytes<ResultType, ContentType>((UnsafeMutablePointer<ContentType>) throws -> ResultType) rethrows -> ResultType`](https://developer.apple.com/documentation/foundation/data/withunsafemutablebytes\(_:\)-7ac1g)
Mutates the raw bytes in the data’s buffer.
[`func copyBytes(to: UnsafeMutablePointer<UInt8>, count: Int)`](https://developer.apple.com/documentation/foundation/data/copybytes\(to:count:\))
Copies the contents of the data to memory.
[`func copyBytes(to: UnsafeMutablePointer<UInt8>, from: Range<Data.Index>)`](https://developer.apple.com/documentation/foundation/data/copybytes\(to:from:\)-8qk4r)
Copies a subset of the contents of the data to memory.
[`func copyBytes<DestinationType>(to: UnsafeMutableBufferPointer<DestinationType>, from: Range<Data.Index>?) -> Int`](https://developer.apple.com/documentation/foundation/data/copybytes\(to:from:\)-4o6zj)
Copies the bytes in a range from the data into a buffer.
### [Adding Bytes](https://developer.apple.com/documentation/Foundation/Data#Adding-Bytes)
[`func append(Data)`](https://developer.apple.com/documentation/foundation/data/append\(_:\)-vjwy)
Appends the specified data to the end of this data.
[`func append<SourceType>(UnsafeBufferPointer<SourceType>)`](https://developer.apple.com/documentation/foundation/data/append\(_:\)-xtlw)
Append a buffer of bytes to the data.
[`func append(UnsafePointer<UInt8>, count: Int)`](https://developer.apple.com/documentation/foundation/data/append\(_:count:\))
Appends the specified bytes from memory to the end of the data.
[`func append(contentsOf: [UInt8])`](https://developer.apple.com/documentation/foundation/data/append\(contentsof:\))
Appends the bytes in the specified array to the end of the data.
### [Replacing a Range of Bytes](https://developer.apple.com/documentation/Foundation/Data#Replacing-a-Range-of-Bytes)
[`func replaceSubrange(Range<Data.Index>, with: Data)`](https://developer.apple.com/documentation/foundation/data/replacesubrange\(_:with:\)-3jcfi)
Replaces a region of bytes in the data with new data.
[`func replaceSubrange<ByteCollection>(Range<Data.Index>, with: ByteCollection)`](https://developer.apple.com/documentation/foundation/data/replacesubrange\(_:with:\)-9u7ry)
Replaces a region of bytes in the data with new bytes from a collection.
[`func replaceSubrange<SourceType>(Range<Data.Index>, with: UnsafeBufferPointer<SourceType>)`](https://developer.apple.com/documentation/foundation/data/replacesubrange\(_:with:\)-9nzh)
Replaces a region of bytes in the data with new bytes from a buffer.
[`func replaceSubrange(Range<Data.Index>, with: UnsafeRawPointer, count: Int)`](https://developer.apple.com/documentation/foundation/data/replacesubrange\(_:with:count:\))
Replaces a region of bytes in the data with bytes from memory.
### [Finding Bytes](https://developer.apple.com/documentation/Foundation/Data#Finding-Bytes)
[`func range(of: Data, options: Data.SearchOptions, in: Range<Data.Index>?) -> Range<Data.Index>?`](https://developer.apple.com/documentation/foundation/data/range\(of:options:in:\))
Finds the range of the specified data as a subsequence of this data, if it exists.
[`typealias SearchOptions`](https://developer.apple.com/documentation/foundation/data/searchoptions)
Options that control a data search operation.
### [Excluding Bytes](https://developer.apple.com/documentation/Foundation/Data#Excluding-Bytes)
[`func advanced(by: Int) -> Data`](https://developer.apple.com/documentation/foundation/data/advanced\(by:\))
Returns a new data buffer created by removing the given number of bytes from the front of the original buffer.
### [Iterating Over Bytes](https://developer.apple.com/documentation/Foundation/Data#Iterating-Over-Bytes)
[`func makeIterator() -> Data.Iterator`](https://developer.apple.com/documentation/foundation/data/makeiterator\(\))
Returns an iterator over the contents of the data.
[`func enumerateBytes((UnsafeBufferPointer<UInt8>, Data.Index, inout Bool) -> Void)`](https://developer.apple.com/documentation/foundation/data/enumeratebytes\(_:\))
Enumerates the contents of the data’s buffer.
### [Splitting the Buffer](https://developer.apple.com/documentation/Foundation/Data#Splitting-the-Buffer)
[`func subdata(in: Range<Data.Index>) -> Data`](https://developer.apple.com/documentation/foundation/data/subdata\(in:\))
Returns a new copy of the data in a specified range.
### [Comparing Data](https://developer.apple.com/documentation/Foundation/Data#Comparing-Data)
[`static func == (Data, Data) -> Bool`](https://developer.apple.com/documentation/foundation/data/==\(_:_:\))
Returns `true` if the two `Data` arguments are equal.
### [Manipulating Indexes](https://developer.apple.com/documentation/Foundation/Data#Manipulating-Indexes)
[`var startIndex: Data.Index`](https://developer.apple.com/documentation/foundation/data/startindex)
The beginning index into the data.
[`var endIndex: Data.Index`](https://developer.apple.com/documentation/foundation/data/endindex)
The end index into the data.
### [Describing Data](https://developer.apple.com/documentation/Foundation/Data#Describing-Data)
[`var description: String`](https://developer.apple.com/documentation/foundation/data/description)
A human-readable description for the data.
[`var debugDescription: String`](https://developer.apple.com/documentation/foundation/data/debugdescription)
A human-readable debug description for the data.
### [Using Reference Types](https://developer.apple.com/documentation/Foundation/Data#Using-Reference-Types)
[`class NSData`](https://developer.apple.com/documentation/foundation/nsdata)
A static byte buffer in memory.
[`class NSMutableData`](https://developer.apple.com/documentation/foundation/nsmutabledata)
An object representing a dynamic byte buffer in memory.
### [Initializers](https://developer.apple.com/documentation/Foundation/Data#Initializers)
[`init?(base64Encoded: Data, options: Data.Base64DecodingOptions)`](https://developer.apple.com/documentation/foundation/data/init\(base64encoded:options:\)-1g88z)
Initialize a `Data` from a Base-64, UTF-8 encoded `Data`.
[`init?(base64Encoded: String, options: Data.Base64DecodingOptions)`](https://developer.apple.com/documentation/foundation/data/init\(base64encoded:options:\)-654f)
Initialize a `Data` from a Base-64 encoded String using the given options.
[`init(bytes: Array<UInt8>)`](https://developer.apple.com/documentation/foundation/data/init\(bytes:\)-5krj4)
[`init<S>(bytes: S)`](https://developer.apple.com/documentation/foundation/data/init\(bytes:\)-5s0rs)
[`init(bytes: ArraySlice<UInt8>)`](https://developer.apple.com/documentation/foundation/data/init\(bytes:\)-9othw)
[`init(contentsOf: URL, options: Data.ReadingOptions) throws`](https://developer.apple.com/documentation/foundation/data/init\(contentsof:options:\))
Initialize a `Data` with the contents of a `URL`.
[`init(referencing: NSData)`](https://developer.apple.com/documentation/foundation/data/init\(referencing:\))
Initialize a `Data` by adopting a reference type.
[`init(repeating: UInt8, count: Int)`](https://developer.apple.com/documentation/foundation/data/init\(repeating:count:\))
Initialize a `Data` with a repeating byte pattern
### [Instance Properties](https://developer.apple.com/documentation/Foundation/Data#Instance-Properties)
[`var bytes: RawSpan`](https://developer.apple.com/documentation/foundation/data/bytes)
[`var count: Int`](https://developer.apple.com/documentation/foundation/data/count)
The number of bytes in the data.
[`var mutableBytes: MutableRawSpan`](https://developer.apple.com/documentation/foundation/data/mutablebytes)
[`var mutableSpan: MutableSpan<UInt8>`](https://developer.apple.com/documentation/foundation/data/mutablespan)
[`var span: Span<UInt8>`](https://developer.apple.com/documentation/foundation/data/span)
### [Instance Methods](https://developer.apple.com/documentation/Foundation/Data#Instance-Methods)
[`func hash(into: inout Hasher)`](https://developer.apple.com/documentation/foundation/data/hash\(into:\))
The hash value for the data.
[`func withUnsafeMutableBytes<ResultType>((UnsafeMutableRawBufferPointer) throws -> ResultType) rethrows -> ResultType`](https://developer.apple.com/documentation/foundation/data/withunsafemutablebytes\(_:\)-8o6xa)
### [Subscripts](https://developer.apple.com/documentation/Foundation/Data#Subscripts)
[`subscript<R>(R) -> Data`](https://developer.apple.com/documentation/foundation/data/subscript\(_:\)-59z5z)
### [Default Implementations](https://developer.apple.com/documentation/Foundation/Data#Default-Implementations)
[API Reference Attachable Implementations](https://developer.apple.com/documentation/foundation/data/attachable-implementations)
[API Reference CustomDebugStringConvertible Implementations](https://developer.apple.com/documentation/foundation/data/customdebugstringconvertible-implementations)
[API Reference CustomStringConvertible Implementations](https://developer.apple.com/documentation/foundation/data/customstringconvertible-implementations)
## [Relationships](https://developer.apple.com/documentation/Foundation/Data#relationships)
### [Conforms To](https://developer.apple.com/documentation/Foundation/Data#conforms-to)
  * [`Attachable`](https://developer.apple.com/documentation/Testing/Attachable)
  * [`BidirectionalCollection`](https://developer.apple.com/documentation/Swift/BidirectionalCollection)
  * [`CKRecordValueProtocol`](https://developer.apple.com/documentation/CloudKit/CKRecordValueProtocol)
  * [`Collection`](https://developer.apple.com/documentation/Swift/Collection)
  * [`ContiguousBytes`](https://developer.apple.com/documentation/foundation/contiguousbytes)
  * [`Copyable`](https://developer.apple.com/documentation/Swift/Copyable)
  * [`CustomDebugStringConvertible`](https://developer.apple.com/documentation/Swift/CustomDebugStringConvertible)
  * [`CustomReflectable`](https://developer.apple.com/documentation/Swift/CustomReflectable)
  * [`CustomStringConvertible`](https://developer.apple.com/documentation/Swift/CustomStringConvertible)
  * [`DataProtocol`](https://developer.apple.com/documentation/foundation/dataprotocol)
  * [`Decodable`](https://developer.apple.com/documentation/Swift/Decodable)
  * [`Encodable`](https://developer.apple.com/documentation/Swift/Encodable)
  * [`Equatable`](https://developer.apple.com/documentation/Swift/Equatable)
  * [`Hashable`](https://developer.apple.com/documentation/Swift/Hashable)
  * [`MutableCollection`](https://developer.apple.com/documentation/Swift/MutableCollection)
  * [`MutableDataProtocol`](https://developer.apple.com/documentation/foundation/mutabledataprotocol)
  * [`RandomAccessCollection`](https://developer.apple.com/documentation/Swift/RandomAccessCollection)
  * [`RangeReplaceableCollection`](https://developer.apple.com/documentation/Swift/RangeReplaceableCollection)
  * [`ReferenceConvertible`](https://developer.apple.com/documentation/foundation/referenceconvertible)
  * [`Sendable`](https://developer.apple.com/documentation/Swift/Sendable)
  * [`SendableMetatype`](https://developer.apple.com/documentation/Swift/SendableMetatype)
  * [`Sequence`](https://developer.apple.com/documentation/Swift/Sequence)
  * [`Transferable`](https://developer.apple.com/documentation/CoreTransferable/Transferable)


## [See Also](https://developer.apple.com/documentation/Foundation/Data#see-also)
### [Binary Data](https://developer.apple.com/documentation/Foundation/Data#Binary-Data)
[`protocol DataProtocol`](https://developer.apple.com/documentation/foundation/dataprotocol)
A protocol that provides consistent data access to the bytes underlying contiguous and noncontiguous data buffers.
[`protocol MutableDataProtocol`](https://developer.apple.com/documentation/foundation/mutabledataprotocol)
A protocol that provides consistent data access to the bytes underlying contiguous and noncontiguous mutable data buffers.
[`protocol ContiguousBytes`](https://developer.apple.com/documentation/foundation/contiguousbytes)
A protocol that declares the type offers direct access to the underlying raw bytes in a contiguous manner.
Current page is Data 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FFoundation%2FData).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
