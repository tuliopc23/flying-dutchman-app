Source: https://developer.apple.com/documentation/Combine/Publisher

[ Skip Navigation ](https://developer.apple.com/documentation/Combine/Publisher#app-main)
  * [Global Nav Open Menu](https://developer.apple.com/documentation/Combine/Publisher#ac-gn-menustate)[Global Nav Close Menu](https://developer.apple.com/documentation/Combine/Publisher)
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
[ Open Menu ](https://developer.apple.com/documentation/Combine/Publisher)
  * SwiftLanguage: Swift


[](https://developer.apple.com/documentation/Combine/Publisher)
## [ Combine  ](https://developer.apple.com/documentation/combine)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 51 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 51 symbols inside <root>
Essentials
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
2 of 51 symbols inside <root> [Receiving and Handling Events with Combine](https://developer.apple.com/documentation/combine/receiving-and-handling-events-with-combine)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
3 of 51 symbols inside <root>
Publishers
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
rP
4 of 51 symbols inside <root> containing 149 symbols[Publisher](https://developer.apple.com/documentation/combine/publisher)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
1 of 149 symbols inside -205249544 
Declaring supporting types
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
2 of 149 symbols inside -205249544 [Output](https://developer.apple.com/documentation/combine/publisher/output)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
Collection
3 of 149 symbols inside -205249544 [Failure](https://developer.apple.com/documentation/combine/publisher/failure)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
4 of 149 symbols inside -205249544 
Working with subscribers
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
5 of 149 symbols inside -205249544 [func receive<S>(subscriber: S)](https://developer.apple.com/documentation/combine/publisher/receive\(subscriber:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
6 of 149 symbols inside -205249544 [func subscribe<S>(S)](https://developer.apple.com/documentation/combine/publisher/subscribe\(_:\)-4u8kn)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
7 of 149 symbols inside -205249544 [func subscribe<S>(S) -> AnyCancellable](https://developer.apple.com/documentation/combine/publisher/subscribe\(_:\)-3fk20)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
8 of 149 symbols inside -205249544 
Mapping elements
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
9 of 149 symbols inside -205249544 [func map<T>((Self.Output) -> T) -> Publishers.Map<Self, T>](https://developer.apple.com/documentation/combine/publisher/map\(_:\)-99evh)
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
10 of 149 symbols inside -205249544 [func tryMap<T>((Self.Output) throws -> T) -> Publishers.TryMap<Self, T>](https://developer.apple.com/documentation/combine/publisher/trymap\(_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
11 of 149 symbols inside -205249544 [func mapError<E>((Self.Failure) -> E) -> Publishers.MapError<Self, E>](https://developer.apple.com/documentation/combine/publisher/maperror\(_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
12 of 149 symbols inside -205249544 [func replaceNil<T>(with: T) -> Publishers.Map<Self, T>](https://developer.apple.com/documentation/combine/publisher/replacenil\(with:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
13 of 149 symbols inside -205249544 [func scan<T>(T, (T, Self.Output) -> T) -> Publishers.Scan<Self, T>](https://developer.apple.com/documentation/combine/publisher/scan\(_:_:\))
To navigate the symbols, press Up Arrow, Down Arrow, Left Arrow or Right Arrow 
M
14 of 149 symbols inside -205249544 [func tryScan<T>(T, (T, Self.Output) throws -> T) -> Publishers.TryScan<Self, T>](https://developer.apple.com/documentation/combine/publisher/tryscan\(_:_:\))
200 items were found. Tab back to navigate through them. 
/ 
Navigator is ready 
  * [ Combine ](https://developer.apple.com/documentation/combine)
  * [ Publisher ](https://developer.apple.com/documentation/Combine/Publisher)
  *     * Publisher 


Protocol
# Publisher
Declares that a type can transmit a sequence of values over time.
iOS 13.0+iPadOS 13.0+Mac Catalyst 13.0+macOS 10.15+tvOS 13.0+visionOS 1.0+watchOS 6.0+
```
protocol Publisher<[Output](https://developer.apple.com/documentation/combine/publisher/output), [Failure](https://developer.apple.com/documentation/combine/publisher/failure)>
```

## [ Mentioned in ](https://developer.apple.com/documentation/Combine/Publisher#mentions)
[](https://developer.apple.com/documentation/combine/processing-published-elements-with-subscribers)
[](https://developer.apple.com/documentation/combine/receiving-and-handling-events-with-combine)
[](https://developer.apple.com/documentation/combine/using-combine-for-your-app-s-asynchronous-code)
## [Overview](https://developer.apple.com/documentation/Combine/Publisher#overview)
A publisher delivers elements to one or more [`Subscriber`](https://developer.apple.com/documentation/combine/subscriber) instances. The subscriber’s [`Input`](https://developer.apple.com/documentation/combine/subscriber/input) and [`Failure`](https://developer.apple.com/documentation/combine/subscriber/failure) associated types must match the [`Output`](https://developer.apple.com/documentation/combine/publisher/output) and [`Failure`](https://developer.apple.com/documentation/combine/publisher/failure) types declared by the publisher. The publisher implements the [`receive(subscriber:)`](https://developer.apple.com/documentation/combine/publisher/receive\(subscriber:\))method to accept a subscriber.
After this, the publisher can call the following methods on the subscriber:
  * [`receive(subscription:)`](https://developer.apple.com/documentation/combine/subscriber/receive\(subscription:\)): Acknowledges the subscribe request and returns a [`Subscription`](https://developer.apple.com/documentation/combine/subscription) instance. The subscriber uses the subscription to demand elements from the publisher and can use it to cancel publishing.
  * [`receive(_:)`](https://developer.apple.com/documentation/combine/subscriber/receive\(_:\)): Delivers one element from the publisher to the subscriber.
  * [`receive(completion:)`](https://developer.apple.com/documentation/combine/subscriber/receive\(completion:\)): Informs the subscriber that publishing has ended, either normally or with an error.


Every `Publisher` must adhere to this contract for downstream subscribers to function correctly.
Tip
A Combine publisher fills a role similar to, but distinct from, the [`AsyncSequence`](https://developer.apple.com/documentation/Swift/AsyncSequence) in the Swift standard library. A `Publisher` and an `AsyncSequence` both produce elements over time. However, the pull model in Combine uses a [`Subscriber`](https://developer.apple.com/documentation/combine/subscriber) to request elements from a publisher, while Swift concurrency uses the `for`-`await`-`in` syntax to iterate over elements published by an `AsyncSequence`. Both APIs offer methods to modify the sequence by mapping or filtering elements, while only Combine provides time-based operations like [`debounce(for:scheduler:options:)`](https://developer.apple.com/documentation/combine/publisher/debounce\(for:scheduler:options:\)) and [`throttle(for:scheduler:latest:)`](https://developer.apple.com/documentation/combine/publisher/throttle\(for:scheduler:latest:\)), and combining operations like [`merge(with:)`](https://developer.apple.com/documentation/combine/publisher/merge\(with:\)-7fk3a) and [`combineLatest(_:_:)`](https://developer.apple.com/documentation/combine/publisher/combinelatest\(_:_:\)-1n30g). To bridge the two approaches, the property [`values`](https://developer.apple.com/documentation/combine/publisher/values-1dm9r) exposes a publisher’s elements as an `AsyncSequence`, allowing you to iterate over them with `for`-`await`-`in` rather than attaching a [`Subscriber`](https://developer.apple.com/documentation/combine/subscriber).
### [Using operators](https://developer.apple.com/documentation/Combine/Publisher#Using-operators)
Extensions on `Publisher` define a wide variety of _operators_ that you compose to create sophisticated event-processing chains. Each operator returns a type that implements the [`Publisher`](https://developer.apple.com/documentation/combine/publisher) protocol Most of these types exist as extensions on the [`Publishers`](https://developer.apple.com/documentation/combine/publishers) enumeration. For example, the [`map(_:)`](https://developer.apple.com/documentation/combine/publisher/map\(_:\)-99evh) operator returns an instance of [`Publishers.Map`](https://developer.apple.com/documentation/combine/publishers/map).
Use operators to assemble a chain of republishers, optionally ending with a subscriber, that processes elements produced by upstream publishers. Each operator creates and configures an instance of a [`Publisher`](https://developer.apple.com/documentation/combine/publisher) or [`Subscriber`](https://developer.apple.com/documentation/combine/subscriber), and subscribes it to the publisher that you call the method on.
In the following example, a sequence publisher emits the integers 1, 2, 3, 4, and 5. A [`filter(_:)`](https://developer.apple.com/documentation/combine/publisher/filter\(_:\)) operator creates a [`Publishers.Filter`](https://developer.apple.com/documentation/combine/publishers/filter) publisher to only republish even values. A second operator creates a [`Subscribers.Sink`](https://developer.apple.com/documentation/combine/subscribers/sink) subscriber to print out each value received. The sink subscriber automatically subscribes to the filter publisher, at which point the filter publisher subscribes to its upstream publisher, the sequence publisher.
```
let cancellable = [1, 2, 3, 4, 5].publisher
    .filter {
        $0 % 2 == 0
    }
    .sink {
        print ("Even number: \($0)")
    }
// Prints:
// Even number: 2
// Even number: 4

```

## [Creating Your Own Publishers](https://developer.apple.com/documentation/Combine/Publisher#Creating-Your-Own-Publishers)
Rather than implementing the `Publisher` protocol yourself, you can create your own publisher by using one of several types provided by the Combine framework:
  * Use a concrete subclass of [`Subject`](https://developer.apple.com/documentation/combine/subject), such as [`PassthroughSubject`](https://developer.apple.com/documentation/combine/passthroughsubject), to publish values on-demand by calling its [`send(_:)`](https://developer.apple.com/documentation/combine/subject/send\(_:\)) method.
  * Use a [`CurrentValueSubject`](https://developer.apple.com/documentation/combine/currentvaluesubject) to publish whenever you update the subject’s underlying value.
  * Add the `@Published` annotation to a property of one of your own types. In doing so, the property gains a publisher that emits an event whenever the property’s value changes. See the [`Published`](https://developer.apple.com/documentation/combine/published) type for an example of this approach.


## [Topics](https://developer.apple.com/documentation/Combine/Publisher#topics)
### [Declaring supporting types](https://developer.apple.com/documentation/Combine/Publisher#Declaring-supporting-types)
[`associatedtype Output`](https://developer.apple.com/documentation/combine/publisher/output)
The kind of values published by this publisher.
**Required**
[`associatedtype Failure : Error`](https://developer.apple.com/documentation/combine/publisher/failure)
The kind of errors this publisher might publish.
**Required**
### [Working with subscribers](https://developer.apple.com/documentation/Combine/Publisher#Working-with-subscribers)
[`func receive<S>(subscriber: S)`](https://developer.apple.com/documentation/combine/publisher/receive\(subscriber:\))
Attaches the specified subscriber to this publisher.
**Required**
[`func subscribe<S>(S)`](https://developer.apple.com/documentation/combine/publisher/subscribe\(_:\)-4u8kn)
Attaches the specified subscriber to this publisher.
[`func subscribe<S>(S) -> AnyCancellable`](https://developer.apple.com/documentation/combine/publisher/subscribe\(_:\)-3fk20)
Attaches the specified subject to this publisher.
### [Mapping elements](https://developer.apple.com/documentation/Combine/Publisher#Mapping-elements)
[`func map<T>((Self.Output) -> T) -> Publishers.Map<Self, T>`](https://developer.apple.com/documentation/combine/publisher/map\(_:\)-99evh)
Transforms all elements from the upstream publisher with a provided closure.
[`func tryMap<T>((Self.Output) throws -> T) -> Publishers.TryMap<Self, T>`](https://developer.apple.com/documentation/combine/publisher/trymap\(_:\))
Transforms all elements from the upstream publisher with a provided error-throwing closure.
[`func mapError<E>((Self.Failure) -> E) -> Publishers.MapError<Self, E>`](https://developer.apple.com/documentation/combine/publisher/maperror\(_:\))
Converts any failure from the upstream publisher into a new error.
[`func replaceNil<T>(with: T) -> Publishers.Map<Self, T>`](https://developer.apple.com/documentation/combine/publisher/replacenil\(with:\))
Replaces nil elements in the stream with the provided element.
[`func scan<T>(T, (T, Self.Output) -> T) -> Publishers.Scan<Self, T>`](https://developer.apple.com/documentation/combine/publisher/scan\(_:_:\))
Transforms elements from the upstream publisher by providing the current element to a closure along with the last value returned by the closure.
[`func tryScan<T>(T, (T, Self.Output) throws -> T) -> Publishers.TryScan<Self, T>`](https://developer.apple.com/documentation/combine/publisher/tryscan\(_:_:\))
Transforms elements from the upstream publisher by providing the current element to an error-throwing closure along with the last value returned by the closure.
[`func setFailureType<E>(to: E.Type) -> Publishers.SetFailureType<Self, E>`](https://developer.apple.com/documentation/combine/publisher/setfailuretype\(to:\))
Changes the failure type declared by the upstream publisher.
### [Filtering elements](https://developer.apple.com/documentation/Combine/Publisher#Filtering-elements)
[`func filter((Self.Output) -> Bool) -> Publishers.Filter<Self>`](https://developer.apple.com/documentation/combine/publisher/filter\(_:\))
Republishes all elements that match a provided closure.
[`func tryFilter((Self.Output) throws -> Bool) -> Publishers.TryFilter<Self>`](https://developer.apple.com/documentation/combine/publisher/tryfilter\(_:\))
Republishes all elements that match a provided error-throwing closure.
[`func compactMap<T>((Self.Output) -> T?) -> Publishers.CompactMap<Self, T>`](https://developer.apple.com/documentation/combine/publisher/compactmap\(_:\))
Calls a closure with each received element and publishes any returned optional that has a value.
[`func tryCompactMap<T>((Self.Output) throws -> T?) -> Publishers.TryCompactMap<Self, T>`](https://developer.apple.com/documentation/combine/publisher/trycompactmap\(_:\))
Calls an error-throwing closure with each received element and publishes any returned optional that has a value.
[`func removeDuplicates() -> Publishers.RemoveDuplicates<Self>`](https://developer.apple.com/documentation/combine/publisher/removeduplicates\(\))
Publishes only elements that don’t match the previous element.
[`func removeDuplicates(by: (Self.Output, Self.Output) -> Bool) -> Publishers.RemoveDuplicates<Self>`](https://developer.apple.com/documentation/combine/publisher/removeduplicates\(by:\))
Publishes only elements that don’t match the previous element, as evaluated by a provided closure.
[`func tryRemoveDuplicates(by: (Self.Output, Self.Output) throws -> Bool) -> Publishers.TryRemoveDuplicates<Self>`](https://developer.apple.com/documentation/combine/publisher/tryremoveduplicates\(by:\))
Publishes only elements that don’t match the previous element, as evaluated by a provided error-throwing closure.
[`func replaceEmpty(with: Self.Output) -> Publishers.ReplaceEmpty<Self>`](https://developer.apple.com/documentation/combine/publisher/replaceempty\(with:\))
Replaces an empty stream with the provided element.
[`func replaceError(with: Self.Output) -> Publishers.ReplaceError<Self>`](https://developer.apple.com/documentation/combine/publisher/replaceerror\(with:\))
Replaces any errors in the stream with the provided element.
### [Reducing elements](https://developer.apple.com/documentation/Combine/Publisher#Reducing-elements)
[`func collect() -> Publishers.Collect<Self>`](https://developer.apple.com/documentation/combine/publisher/collect\(\))
Collects all received elements, and emits a single array of the collection when the upstream publisher finishes.
[`func collect(Int) -> Publishers.CollectByCount<Self>`](https://developer.apple.com/documentation/combine/publisher/collect\(_:\))
Collects up to the specified number of elements, and then emits a single array of the collection.
[`func collect<S>(Publishers.TimeGroupingStrategy<S>, options: S.SchedulerOptions?) -> Publishers.CollectByTime<Self, S>`](https://developer.apple.com/documentation/combine/publisher/collect\(_:options:\))
Collects elements by a given time-grouping strategy, and emits a single array of the collection.
[`enum TimeGroupingStrategy`](https://developer.apple.com/documentation/combine/publishers/timegroupingstrategy)
A strategy for collecting received elements.
[`func ignoreOutput() -> Publishers.IgnoreOutput<Self>`](https://developer.apple.com/documentation/combine/publisher/ignoreoutput\(\))
Ignores all upstream elements, but passes along the upstream publisher’s completion state (finished or failed).
[`func reduce<T>(T, (T, Self.Output) -> T) -> Publishers.Reduce<Self, T>`](https://developer.apple.com/documentation/combine/publisher/reduce\(_:_:\))
Applies a closure that collects each element of a stream and publishes a final result upon completion.
[`func tryReduce<T>(T, (T, Self.Output) throws -> T) -> Publishers.TryReduce<Self, T>`](https://developer.apple.com/documentation/combine/publisher/tryreduce\(_:_:\))
Applies an error-throwing closure that collects each element of a stream and publishes a final result upon completion.
### [Applying mathematical operations on elements](https://developer.apple.com/documentation/Combine/Publisher#Applying-mathematical-operations-on-elements)
[`func count() -> Publishers.Count<Self>`](https://developer.apple.com/documentation/combine/publisher/count\(\))
Publishes the number of elements received from the upstream publisher.
[`func max() -> Publishers.Comparison<Self>`](https://developer.apple.com/documentation/combine/publisher/max\(\))
Publishes the maximum value received from the upstream publisher, after it finishes.
[`func max(by: (Self.Output, Self.Output) -> Bool) -> Publishers.Comparison<Self>`](https://developer.apple.com/documentation/combine/publisher/max\(by:\))
Publishes the maximum value received from the upstream publisher, using the provided ordering closure.
[`func tryMax(by: (Self.Output, Self.Output) throws -> Bool) -> Publishers.TryComparison<Self>`](https://developer.apple.com/documentation/combine/publisher/trymax\(by:\))
Publishes the maximum value received from the upstream publisher, using the provided error-throwing closure to order the items.
[`func min() -> Publishers.Comparison<Self>`](https://developer.apple.com/documentation/combine/publisher/min\(\))
Publishes the minimum value received from the upstream publisher, after it finishes.
[`func min(by: (Self.Output, Self.Output) -> Bool) -> Publishers.Comparison<Self>`](https://developer.apple.com/documentation/combine/publisher/min\(by:\))
Publishes the minimum value received from the upstream publisher, after it finishes.
[`func tryMin(by: (Self.Output, Self.Output) throws -> Bool) -> Publishers.TryComparison<Self>`](https://developer.apple.com/documentation/combine/publisher/trymin\(by:\))
Publishes the minimum value received from the upstream publisher, using the provided error-throwing closure to order the items.
### [Applying matching criteria to elements](https://developer.apple.com/documentation/Combine/Publisher#Applying-matching-criteria-to-elements)
[`func contains(Self.Output) -> Publishers.Contains<Self>`](https://developer.apple.com/documentation/combine/publisher/contains\(_:\))
Publishes a Boolean value upon receiving an element equal to the argument.
[`func contains(where: (Self.Output) -> Bool) -> Publishers.ContainsWhere<Self>`](https://developer.apple.com/documentation/combine/publisher/contains\(where:\))
Publishes a Boolean value upon receiving an element that satisfies the predicate closure.
[`func tryContains(where: (Self.Output) throws -> Bool) -> Publishers.TryContainsWhere<Self>`](https://developer.apple.com/documentation/combine/publisher/trycontains\(where:\))
Publishes a Boolean value upon receiving an element that satisfies the throwing predicate closure.
[`func allSatisfy((Self.Output) -> Bool) -> Publishers.AllSatisfy<Self>`](https://developer.apple.com/documentation/combine/publisher/allsatisfy\(_:\))
Publishes a single Boolean value that indicates whether all received elements pass a given predicate.
[`func tryAllSatisfy((Self.Output) throws -> Bool) -> Publishers.TryAllSatisfy<Self>`](https://developer.apple.com/documentation/combine/publisher/tryallsatisfy\(_:\))
Publishes a single Boolean value that indicates whether all received elements pass a given error-throwing predicate.
### [Applying sequence operations to elements](https://developer.apple.com/documentation/Combine/Publisher#Applying-sequence-operations-to-elements)
[`func drop<P>(untilOutputFrom: P) -> Publishers.DropUntilOutput<Self, P>`](https://developer.apple.com/documentation/combine/publisher/drop\(untiloutputfrom:\))
Ignores elements from the upstream publisher until it receives an element from a second publisher.
[`func dropFirst(Int) -> Publishers.Drop<Self>`](https://developer.apple.com/documentation/combine/publisher/dropfirst\(_:\))
Omits the specified number of elements before republishing subsequent elements.
[`func drop(while: (Self.Output) -> Bool) -> Publishers.DropWhile<Self>`](https://developer.apple.com/documentation/combine/publisher/drop\(while:\))
Omits elements from the upstream publisher until a given closure returns false, before republishing all remaining elements.
[`func tryDrop(while: (Self.Output) throws -> Bool) -> Publishers.TryDropWhile<Self>`](https://developer.apple.com/documentation/combine/publisher/trydrop\(while:\))
Omits elements from the upstream publisher until an error-throwing closure returns false, before republishing all remaining elements.
[`func append(Self.Output...) -> Publishers.Concatenate<Self, Publishers.Sequence<[Self.Output], Self.Failure>>`](https://developer.apple.com/documentation/combine/publisher/append\(_:\)-1qb8d)
Appends a publisher’s output with the specified elements.
[`func append<S>(S) -> Publishers.Concatenate<Self, Publishers.Sequence<S, Self.Failure>>`](https://developer.apple.com/documentation/combine/publisher/append\(_:\)-69sdn)
Appends a publisher’s output with the specified sequence.
[`func append<P>(P) -> Publishers.Concatenate<Self, P>`](https://developer.apple.com/documentation/combine/publisher/append\(_:\)-5yh02)
Appends the output of this publisher with the elements emitted by the given publisher.
[`func prepend(Self.Output...) -> Publishers.Concatenate<Publishers.Sequence<[Self.Output], Self.Failure>, Self>`](https://developer.apple.com/documentation/combine/publisher/prepend\(_:\)-7wk5l)
Prefixes a publisher’s output with the specified values.
[`func prepend<S>(S) -> Publishers.Concatenate<Publishers.Sequence<S, Self.Failure>, Self>`](https://developer.apple.com/documentation/combine/publisher/prepend\(_:\)-v9sb)
Prefixes a publisher’s output with the specified sequence.
[`func prepend<P>(P) -> Publishers.Concatenate<P, Self>`](https://developer.apple.com/documentation/combine/publisher/prepend\(_:\)-5dj9c)
Prefixes the output of this publisher with the elements emitted by the given publisher.
[`func prefix(Int) -> Publishers.Output<Self>`](https://developer.apple.com/documentation/combine/publisher/prefix\(_:\))
Republishes elements up to the specified maximum count.
[`func prefix(while: (Self.Output) -> Bool) -> Publishers.PrefixWhile<Self>`](https://developer.apple.com/documentation/combine/publisher/prefix\(while:\))
Republishes elements while a predicate closure indicates publishing should continue.
[`func tryPrefix(while: (Self.Output) throws -> Bool) -> Publishers.TryPrefixWhile<Self>`](https://developer.apple.com/documentation/combine/publisher/tryprefix\(while:\))
Republishes elements while an error-throwing predicate closure indicates publishing should continue.
[`func prefix<P>(untilOutputFrom: P) -> Publishers.PrefixUntilOutput<Self, P>`](https://developer.apple.com/documentation/combine/publisher/prefix\(untiloutputfrom:\))
Republishes elements until another publisher emits an element.
### [Selecting specific elements](https://developer.apple.com/documentation/Combine/Publisher#Selecting-specific-elements)
[`func first() -> Publishers.First<Self>`](https://developer.apple.com/documentation/combine/publisher/first\(\))
Publishes the first element of a stream, then finishes.
[`func first(where: (Self.Output) -> Bool) -> Publishers.FirstWhere<Self>`](https://developer.apple.com/documentation/combine/publisher/first\(where:\))
Publishes the first element of a stream to satisfy a predicate closure, then finishes normally.
[`func tryFirst(where: (Self.Output) throws -> Bool) -> Publishers.TryFirstWhere<Self>`](https://developer.apple.com/documentation/combine/publisher/tryfirst\(where:\))
Publishes the first element of a stream to satisfy a throwing predicate closure, then finishes normally.
[`func last() -> Publishers.Last<Self>`](https://developer.apple.com/documentation/combine/publisher/last\(\))
Publishes the last element of a stream, after the stream finishes.
[`func last(where: (Self.Output) -> Bool) -> Publishers.LastWhere<Self>`](https://developer.apple.com/documentation/combine/publisher/last\(where:\))
Publishes the last element of a stream that satisfies a predicate closure, after upstream finishes.
[`func tryLast(where: (Self.Output) throws -> Bool) -> Publishers.TryLastWhere<Self>`](https://developer.apple.com/documentation/combine/publisher/trylast\(where:\))
Publishes the last element of a stream that satisfies an error-throwing predicate closure, after the stream finishes.
[`func output(at: Int) -> Publishers.Output<Self>`](https://developer.apple.com/documentation/combine/publisher/output\(at:\))
Publishes a specific element, indicated by its index in the sequence of published elements.
[`func output<R>(in: R) -> Publishers.Output<Self>`](https://developer.apple.com/documentation/combine/publisher/output\(in:\))
Publishes elements specified by their range in the sequence of published elements.
### [Collecting and republishing the latest elements from multiple publishers](https://developer.apple.com/documentation/Combine/Publisher#Collecting-and-republishing-the-latest-elements-from-multiple-publishers)
[`func combineLatest<P, T>(P, (Self.Output, P.Output) -> T) -> Publishers.Map<Publishers.CombineLatest<Self, P>, T>`](https://developer.apple.com/documentation/combine/publisher/combinelatest\(_:_:\)-1n30g)
Subscribes to an additional publisher and invokes a closure upon receiving output from either publisher.
[`func combineLatest<P>(P) -> Publishers.CombineLatest<Self, P>`](https://developer.apple.com/documentation/combine/publisher/combinelatest\(_:\))
Subscribes to an additional publisher and publishes a tuple upon receiving output from either publisher.
[`func combineLatest<P, Q, T>(P, Q, (Self.Output, P.Output, Q.Output) -> T) -> Publishers.Map<Publishers.CombineLatest3<Self, P, Q>, T>`](https://developer.apple.com/documentation/combine/publisher/combinelatest\(_:_:_:\)-6ekpz)
Subscribes to two additional publishers and invokes a closure upon receiving output from any of the publishers.
[`func combineLatest<P, Q>(P, Q) -> Publishers.CombineLatest3<Self, P, Q>`](https://developer.apple.com/documentation/combine/publisher/combinelatest\(_:_:\)-5crqg)
Subscribes to two additional publishers and publishes a tuple upon receiving output from any of the publishers.
[`func combineLatest<P, Q, R, T>(P, Q, R, (Self.Output, P.Output, Q.Output, R.Output) -> T) -> Publishers.Map<Publishers.CombineLatest4<Self, P, Q, R>, T>`](https://developer.apple.com/documentation/combine/publisher/combinelatest\(_:_:_:_:\))
Subscribes to three additional publishers and invokes a closure upon receiving output from any of the publishers.
[`func combineLatest<P, Q, R>(P, Q, R) -> Publishers.CombineLatest4<Self, P, Q, R>`](https://developer.apple.com/documentation/combine/publisher/combinelatest\(_:_:_:\)-48buc)
Subscribes to three additional publishers and publishes a tuple upon receiving output from any of the publishers.
### [Republishing elements from multiple publishers as an interleaved stream](https://developer.apple.com/documentation/Combine/Publisher#Republishing-elements-from-multiple-publishers-as-an-interleaved-stream)
[`func merge(with: Self) -> Publishers.MergeMany<Self>`](https://developer.apple.com/documentation/combine/publisher/merge\(with:\)-7fk3a)
Combines elements from this publisher with those from another publisher of the same type, delivering an interleaved sequence of elements.
[`func merge<P>(with: P) -> Publishers.Merge<Self, P>`](https://developer.apple.com/documentation/combine/publisher/merge\(with:\)-7qt71)
Combines elements from this publisher with those from another publisher, delivering an interleaved sequence of elements.
[`func merge<B, C>(with: B, C) -> Publishers.Merge3<Self, B, C>`](https://developer.apple.com/documentation/combine/publisher/merge\(with:_:\))
Combines elements from this publisher with those from two other publishers, delivering an interleaved sequence of elements.
[`func merge<B, C, D>(with: B, C, D) -> Publishers.Merge4<Self, B, C, D>`](https://developer.apple.com/documentation/combine/publisher/merge\(with:_:_:\))
Combines elements from this publisher with those from three other publishers, delivering an interleaved sequence of elements.
[`func merge<B, C, D, E>(with: B, C, D, E) -> Publishers.Merge5<Self, B, C, D, E>`](https://developer.apple.com/documentation/combine/publisher/merge\(with:_:_:_:\))
Combines elements from this publisher with those from four other publishers, delivering an interleaved sequence of elements.
[`func merge<B, C, D, E, F>(with: B, C, D, E, F) -> Publishers.Merge6<Self, B, C, D, E, F>`](https://developer.apple.com/documentation/combine/publisher/merge\(with:_:_:_:_:\))
Combines elements from this publisher with those from five other publishers, delivering an interleaved sequence of elements.
[`func merge<B, C, D, E, F, G>(with: B, C, D, E, F, G) -> Publishers.Merge7<Self, B, C, D, E, F, G>`](https://developer.apple.com/documentation/combine/publisher/merge\(with:_:_:_:_:_:\))
Combines elements from this publisher with those from six other publishers, delivering an interleaved sequence of elements.
[`func merge<B, C, D, E, F, G, H>(with: B, C, D, E, F, G, H) -> Publishers.Merge8<Self, B, C, D, E, F, G, H>`](https://developer.apple.com/documentation/combine/publisher/merge\(with:_:_:_:_:_:_:\))
Combines elements from this publisher with those from seven other publishers, delivering an interleaved sequence of elements.
### [Collecting and republishing the oldest unconsumed elements from multiple publishers](https://developer.apple.com/documentation/Combine/Publisher#Collecting-and-republishing-the-oldest-unconsumed-elements-from-multiple-publishers)
[`func zip<P>(P) -> Publishers.Zip<Self, P>`](https://developer.apple.com/documentation/combine/publisher/zip\(_:\))
Combines elements from another publisher and deliver pairs of elements as tuples.
[`func zip<P, T>(P, (Self.Output, P.Output) -> T) -> Publishers.Map<Publishers.Zip<Self, P>, T>`](https://developer.apple.com/documentation/combine/publisher/zip\(_:_:\)-4xn21)
Combines elements from another publisher and delivers a transformed output.
[`func zip<P, Q>(P, Q) -> Publishers.Zip3<Self, P, Q>`](https://developer.apple.com/documentation/combine/publisher/zip\(_:_:\)-8d7k7)
Combines elements from two other publishers and delivers groups of elements as tuples.
[`func zip<P, Q, T>(P, Q, (Self.Output, P.Output, Q.Output) -> T) -> Publishers.Map<Publishers.Zip3<Self, P, Q>, T>`](https://developer.apple.com/documentation/combine/publisher/zip\(_:_:_:\)-9yqi1)
Combines elements from two other publishers and delivers a transformed output.
[`func zip<P, Q, R>(P, Q, R) -> Publishers.Zip4<Self, P, Q, R>`](https://developer.apple.com/documentation/combine/publisher/zip\(_:_:_:\)-16rcy)
Combines elements from three other publishers and delivers groups of elements as tuples.
[`func zip<P, Q, R, T>(P, Q, R, (Self.Output, P.Output, Q.Output, R.Output) -> T) -> Publishers.Map<Publishers.Zip4<Self, P, Q, R>, T>`](https://developer.apple.com/documentation/combine/publisher/zip\(_:_:_:_:\))
Combines elements from three other publishers and delivers a transformed output.
### [Republishing elements by subscribing to new publishers](https://developer.apple.com/documentation/Combine/Publisher#Republishing-elements-by-subscribing-to-new-publishers)
[`func flatMap<T, P>(maxPublishers: Subscribers.Demand, (Self.Output) -> P) -> Publishers.FlatMap<P, Self>`](https://developer.apple.com/documentation/combine/publisher/flatmap\(maxpublishers:_:\)-3k7z5)
Transforms all elements from an upstream publisher into a new publisher up to a maximum number of publishers you specify.
[`func flatMap<P>(maxPublishers: Subscribers.Demand, (Self.Output) -> P) -> Publishers.FlatMap<P, Publishers.SetFailureType<Self, P.Failure>>`](https://developer.apple.com/documentation/combine/publisher/flatmap\(maxpublishers:_:\)-qxf)
Transforms all elements from an upstream publisher into a new publisher up to a maximum number of publishers you specify.
[`func flatMap<P>(maxPublishers: Subscribers.Demand, (Self.Output) -> P) -> Publishers.FlatMap<P, Self>`](https://developer.apple.com/documentation/combine/publisher/flatmap\(maxpublishers:_:\)-hyb0)
Transforms all elements from an upstream publisher into a new publisher up to a maximum number of publishers you specify.
[`func flatMap<P>(maxPublishers: Subscribers.Demand, (Self.Output) -> P) -> Publishers.FlatMap<Publishers.SetFailureType<P, Self.Failure>, Self>`](https://developer.apple.com/documentation/combine/publisher/flatmap\(maxpublishers:_:\)-4of8w)
Transforms all elements from an upstream publisher into a new publisher up to a maximum number of publishers you specify.
[`func switchToLatest() -> Publishers.SwitchToLatest<Self.Output, Self>`](https://developer.apple.com/documentation/combine/publisher/switchtolatest\(\)-453ht)
Republishes elements sent by the most recently received publisher.
[`func switchToLatest() -> Publishers.SwitchToLatest<Self.Output, Publishers.SetFailureType<Self, Self.Output.Failure>>`](https://developer.apple.com/documentation/combine/publisher/switchtolatest\(\)-1c51y)
Republishes elements sent by the most recently received publisher.
[`func switchToLatest() -> Publishers.SwitchToLatest<Publishers.SetFailureType<Self.Output, Self.Failure>, Publishers.Map<Self, Publishers.SetFailureType<Self.Output, Self.Failure>>>`](https://developer.apple.com/documentation/combine/publisher/switchtolatest\(\)-20v3t)
Republishes elements sent by the most recently received publisher.
[`func switchToLatest() -> Publishers.SwitchToLatest<Self.Output, Self>`](https://developer.apple.com/documentation/combine/publisher/switchtolatest\(\)-9eb3r)
Republishes elements sent by the most recently received publisher.
### [Handling errors](https://developer.apple.com/documentation/Combine/Publisher#Handling-errors)
[`func assertNoFailure(String, file: StaticString, line: UInt) -> Publishers.AssertNoFailure<Self>`](https://developer.apple.com/documentation/combine/publisher/assertnofailure\(_:file:line:\))
Raises a fatal error when its upstream publisher fails, and otherwise republishes all received input.
[`func `catch`<P>((Self.Failure) -> P) -> Publishers.Catch<Self, P>`](https://developer.apple.com/documentation/combine/publisher/catch\(_:\))
Handles errors from an upstream publisher by replacing it with another publisher.
[`func tryCatch<P>((Self.Failure) throws -> P) -> Publishers.TryCatch<Self, P>`](https://developer.apple.com/documentation/combine/publisher/trycatch\(_:\))
Handles errors from an upstream publisher by either replacing it with another publisher or throwing a new error.
[`func retry(Int) -> Publishers.Retry<Self>`](https://developer.apple.com/documentation/combine/publisher/retry\(_:\))
Attempts to recreate a failed subscription with the upstream publisher up to the number of times you specify.
### [Controlling timing](https://developer.apple.com/documentation/Combine/Publisher#Controlling-timing)
[`func measureInterval<S>(using: S, options: S.SchedulerOptions?) -> Publishers.MeasureInterval<Self, S>`](https://developer.apple.com/documentation/combine/publisher/measureinterval\(using:options:\))
Measures and emits the time interval between events received from an upstream publisher.
[`func debounce<S>(for: S.SchedulerTimeType.Stride, scheduler: S, options: S.SchedulerOptions?) -> Publishers.Debounce<Self, S>`](https://developer.apple.com/documentation/combine/publisher/debounce\(for:scheduler:options:\))
Publishes elements only after a specified time interval elapses between events.
[`func delay<S>(for: S.SchedulerTimeType.Stride, tolerance: S.SchedulerTimeType.Stride?, scheduler: S, options: S.SchedulerOptions?) -> Publishers.Delay<Self, S>`](https://developer.apple.com/documentation/combine/publisher/delay\(for:tolerance:scheduler:options:\))
Delays delivery of all output to the downstream receiver by a specified amount of time on a particular scheduler.
[`func throttle<S>(for: S.SchedulerTimeType.Stride, scheduler: S, latest: Bool) -> Publishers.Throttle<Self, S>`](https://developer.apple.com/documentation/combine/publisher/throttle\(for:scheduler:latest:\))
Publishes either the most-recent or first element published by the upstream publisher in the specified time interval.
[`func timeout<S>(S.SchedulerTimeType.Stride, scheduler: S, options: S.SchedulerOptions?, customError: (() -> Self.Failure)?) -> Publishers.Timeout<Self, S>`](https://developer.apple.com/documentation/combine/publisher/timeout\(_:scheduler:options:customerror:\))
Terminates publishing if the upstream publisher exceeds the specified time interval without producing an element.
### [Encoding and decoding](https://developer.apple.com/documentation/Combine/Publisher#Encoding-and-decoding)
[`func encode<Coder>(encoder: Coder) -> Publishers.Encode<Self, Coder>`](https://developer.apple.com/documentation/combine/publisher/encode\(encoder:\))
Encodes the output from upstream using a specified encoder.
[`func decode<Item, Coder>(type: Item.Type, decoder: Coder) -> Publishers.Decode<Self, Item, Coder>`](https://developer.apple.com/documentation/combine/publisher/decode\(type:decoder:\))
Decodes the output from the upstream using a specified decoder.
### [Identifying properties with key paths](https://developer.apple.com/documentation/Combine/Publisher#Identifying-properties-with-key-paths)
[`func map<T>(KeyPath<Self.Output, T>) -> Publishers.MapKeyPath<Self, T>`](https://developer.apple.com/documentation/combine/publisher/map\(_:\)-6sm0a)
Publishes the value of a key path.
[`func map<T0, T1>(KeyPath<Self.Output, T0>, KeyPath<Self.Output, T1>) -> Publishers.MapKeyPath2<Self, T0, T1>`](https://developer.apple.com/documentation/combine/publisher/map\(_:_:\))
Publishes the values of two key paths as a tuple.
[`func map<T0, T1, T2>(KeyPath<Self.Output, T0>, KeyPath<Self.Output, T1>, KeyPath<Self.Output, T2>) -> Publishers.MapKeyPath3<Self, T0, T1, T2>`](https://developer.apple.com/documentation/combine/publisher/map\(_:_:_:\))
Publishes the values of three key paths as a tuple.
### [Working with multiple subscribers](https://developer.apple.com/documentation/Combine/Publisher#Working-with-multiple-subscribers)
[`func multicast<S>(() -> S) -> Publishers.Multicast<Self, S>`](https://developer.apple.com/documentation/combine/publisher/multicast\(_:\))
Applies a closure to create a subject that delivers elements to subscribers.
[`func multicast<S>(subject: S) -> Publishers.Multicast<Self, S>`](https://developer.apple.com/documentation/combine/publisher/multicast\(subject:\))
Provides a subject to deliver elements to multiple subscribers.
[`func share() -> Publishers.Share<Self>`](https://developer.apple.com/documentation/combine/publisher/share\(\))
Shares the output of an upstream publisher with multiple subscribers.
### [Buffering elements](https://developer.apple.com/documentation/Combine/Publisher#Buffering-elements)
[`func buffer(size: Int, prefetch: Publishers.PrefetchStrategy, whenFull: Publishers.BufferingStrategy<Self.Failure>) -> Publishers.Buffer<Self>`](https://developer.apple.com/documentation/combine/publisher/buffer\(size:prefetch:whenfull:\))
Buffers elements received from an upstream publisher.
[`enum PrefetchStrategy`](https://developer.apple.com/documentation/combine/publishers/prefetchstrategy)
A strategy for filling a buffer.
[`enum BufferingStrategy`](https://developer.apple.com/documentation/combine/publishers/bufferingstrategy)
A strategy that handles exhaustion of a buffer’s capacity.
### [Performing type erasure](https://developer.apple.com/documentation/Combine/Publisher#Performing-type-erasure)
[`func eraseToAnyPublisher() -> AnyPublisher<Self.Output, Self.Failure>`](https://developer.apple.com/documentation/combine/publisher/erasetoanypublisher\(\))
Wraps this publisher with a type eraser.
### [Specifying schedulers](https://developer.apple.com/documentation/Combine/Publisher#Specifying-schedulers)
[`func subscribe<S>(on: S, options: S.SchedulerOptions?) -> Publishers.SubscribeOn<Self, S>`](https://developer.apple.com/documentation/combine/publisher/subscribe\(on:options:\))
Specifies the scheduler on which to perform subscribe, cancel, and request operations.
[`func receive<S>(on: S, options: S.SchedulerOptions?) -> Publishers.ReceiveOn<Self, S>`](https://developer.apple.com/documentation/combine/publisher/receive\(on:options:\))
Specifies the scheduler on which to receive elements from the publisher.
### [Adding explicit connectability](https://developer.apple.com/documentation/Combine/Publisher#Adding-explicit-connectability)
[`func makeConnectable() -> Publishers.MakeConnectable<Self>`](https://developer.apple.com/documentation/combine/publisher/makeconnectable\(\))
Creates a connectable wrapper around the publisher.
### [Connecting simple subscribers](https://developer.apple.com/documentation/Combine/Publisher#Connecting-simple-subscribers)
[`func assign<Root>(to: ReferenceWritableKeyPath<Root, Self.Output>, on: Root) -> AnyCancellable`](https://developer.apple.com/documentation/combine/publisher/assign\(to:on:\))
Assigns each element from a publisher to a property on an object.
[`func assign(to: inout Published<Self.Output>.Publisher)`](https://developer.apple.com/documentation/combine/publisher/assign\(to:\))
Republishes elements received from a publisher, by assigning them to a property marked as a publisher.
[`func sink(receiveCompletion: (Subscribers.Completion<Self.Failure>) -> Void, receiveValue: (Self.Output) -> Void) -> AnyCancellable`](https://developer.apple.com/documentation/combine/publisher/sink\(receivecompletion:receivevalue:\))
Attaches a subscriber with closure-based behavior.
[`func sink(receiveValue: (Self.Output) -> Void) -> AnyCancellable`](https://developer.apple.com/documentation/combine/publisher/sink\(receivevalue:\))
Attaches a subscriber with closure-based behavior to a publisher that never fails.
### [Accessing elements asynchronously](https://developer.apple.com/documentation/Combine/Publisher#Accessing-elements-asynchronously)
[`var values: AsyncPublisher<Self>`](https://developer.apple.com/documentation/combine/publisher/values-1dm9r)
The elements produced by the publisher, as an asynchronous sequence.
[`var values: AsyncThrowingPublisher<Self>`](https://developer.apple.com/documentation/combine/publisher/values-v7nz)
The elements produced by the publisher, as a throwing asynchronous sequence.
### [Debugging](https://developer.apple.com/documentation/Combine/Publisher#Debugging)
[`func breakpoint(receiveSubscription: ((any Subscription) -> Bool)?, receiveOutput: ((Self.Output) -> Bool)?, receiveCompletion: ((Subscribers.Completion<Self.Failure>) -> Bool)?) -> Publishers.Breakpoint<Self>`](https://developer.apple.com/documentation/combine/publisher/breakpoint\(receivesubscription:receiveoutput:receivecompletion:\))
Raises a debugger signal when a provided closure needs to stop the process in the debugger.
[`func breakpointOnError() -> Publishers.Breakpoint<Self>`](https://developer.apple.com/documentation/combine/publisher/breakpointonerror\(\))
Raises a debugger signal upon receiving a failure.
[`func handleEvents(receiveSubscription: ((any Subscription) -> Void)?, receiveOutput: ((Self.Output) -> Void)?, receiveCompletion: ((Subscribers.Completion<Self.Failure>) -> Void)?, receiveCancel: (() -> Void)?, receiveRequest: ((Subscribers.Demand) -> Void)?) -> Publishers.HandleEvents<Self>`](https://developer.apple.com/documentation/combine/publisher/handleevents\(receivesubscription:receiveoutput:receivecompletion:receivecancel:receiverequest:\))
Performs the specified closures when publisher events occur.
[`func print(String, to: (any TextOutputStream)?) -> Publishers.Print<Self>`](https://developer.apple.com/documentation/combine/publisher/print\(_:to:\))
Prints log messages for all publishing events.
## [Relationships](https://developer.apple.com/documentation/Combine/Publisher#relationships)
### [Inherited By](https://developer.apple.com/documentation/Combine/Publisher#inherited-by)
  * [`ConnectablePublisher`](https://developer.apple.com/documentation/combine/connectablepublisher)
  * [`Subject`](https://developer.apple.com/documentation/combine/subject)


### [Conforming Types](https://developer.apple.com/documentation/Combine/Publisher#conforming-types)
  * [`AnyPublisher`](https://developer.apple.com/documentation/combine/anypublisher)
Conforms when `Output` conforms to `Copyable`, `Output` conforms to `Escapable`, and `Failure` conforms to `Error`.
  * [`CurrentValueSubject`](https://developer.apple.com/documentation/combine/currentvaluesubject)
  * [`Deferred`](https://developer.apple.com/documentation/combine/deferred)
  * [`Empty`](https://developer.apple.com/documentation/combine/empty)
  * [`Fail`](https://developer.apple.com/documentation/combine/fail)
  * [`Future`](https://developer.apple.com/documentation/combine/future)
  * [`Just`](https://developer.apple.com/documentation/combine/just)
  * [`ObservableObjectPublisher`](https://developer.apple.com/documentation/combine/observableobjectpublisher)
  * [`PassthroughSubject`](https://developer.apple.com/documentation/combine/passthroughsubject)
  * [`Published.Publisher`](https://developer.apple.com/documentation/combine/published/publisher)
  * [`Publishers.AllSatisfy`](https://developer.apple.com/documentation/combine/publishers/allsatisfy)
  * [`Publishers.AssertNoFailure`](https://developer.apple.com/documentation/combine/publishers/assertnofailure)
  * [`Publishers.Autoconnect`](https://developer.apple.com/documentation/combine/publishers/autoconnect)
  * [`Publishers.Breakpoint`](https://developer.apple.com/documentation/combine/publishers/breakpoint)
  * [`Publishers.Buffer`](https://developer.apple.com/documentation/combine/publishers/buffer)
  * [`Publishers.Catch`](https://developer.apple.com/documentation/combine/publishers/catch)
  * [`Publishers.Collect`](https://developer.apple.com/documentation/combine/publishers/collect)
  * [`Publishers.CollectByCount`](https://developer.apple.com/documentation/combine/publishers/collectbycount)
  * [`Publishers.CollectByTime`](https://developer.apple.com/documentation/combine/publishers/collectbytime)
  * [`Publishers.CombineLatest`](https://developer.apple.com/documentation/combine/publishers/combinelatest)
  * [`Publishers.CombineLatest3`](https://developer.apple.com/documentation/combine/publishers/combinelatest3)
  * [`Publishers.CombineLatest4`](https://developer.apple.com/documentation/combine/publishers/combinelatest4)
  * [`Publishers.CompactMap`](https://developer.apple.com/documentation/combine/publishers/compactmap)
  * [`Publishers.Comparison`](https://developer.apple.com/documentation/combine/publishers/comparison)
  * [`Publishers.Concatenate`](https://developer.apple.com/documentation/combine/publishers/concatenate)
  * [`Publishers.Contains`](https://developer.apple.com/documentation/combine/publishers/contains)
  * [`Publishers.ContainsWhere`](https://developer.apple.com/documentation/combine/publishers/containswhere)
  * [`Publishers.Count`](https://developer.apple.com/documentation/combine/publishers/count)
  * [`Publishers.Debounce`](https://developer.apple.com/documentation/combine/publishers/debounce)
  * [`Publishers.Decode`](https://developer.apple.com/documentation/combine/publishers/decode)
  * [`Publishers.Delay`](https://developer.apple.com/documentation/combine/publishers/delay)
  * [`Publishers.Drop`](https://developer.apple.com/documentation/combine/publishers/drop)
  * [`Publishers.DropUntilOutput`](https://developer.apple.com/documentation/combine/publishers/dropuntiloutput)
  * [`Publishers.DropWhile`](https://developer.apple.com/documentation/combine/publishers/dropwhile)
  * [`Publishers.Encode`](https://developer.apple.com/documentation/combine/publishers/encode)
  * [`Publishers.Filter`](https://developer.apple.com/documentation/combine/publishers/filter)
  * [`Publishers.First`](https://developer.apple.com/documentation/combine/publishers/first)
  * [`Publishers.FirstWhere`](https://developer.apple.com/documentation/combine/publishers/firstwhere)
  * [`Publishers.FlatMap`](https://developer.apple.com/documentation/combine/publishers/flatmap)
  * [`Publishers.HandleEvents`](https://developer.apple.com/documentation/combine/publishers/handleevents)
  * [`Publishers.IgnoreOutput`](https://developer.apple.com/documentation/combine/publishers/ignoreoutput)
  * [`Publishers.Last`](https://developer.apple.com/documentation/combine/publishers/last)
  * [`Publishers.LastWhere`](https://developer.apple.com/documentation/combine/publishers/lastwhere)
  * [`Publishers.MakeConnectable`](https://developer.apple.com/documentation/combine/publishers/makeconnectable)
  * [`Publishers.Map`](https://developer.apple.com/documentation/combine/publishers/map)
  * [`Publishers.MapError`](https://developer.apple.com/documentation/combine/publishers/maperror)
  * [`Publishers.MapKeyPath`](https://developer.apple.com/documentation/combine/publishers/mapkeypath)
  * [`Publishers.MapKeyPath2`](https://developer.apple.com/documentation/combine/publishers/mapkeypath2)
  * [`Publishers.MapKeyPath3`](https://developer.apple.com/documentation/combine/publishers/mapkeypath3)
  * [`Publishers.MeasureInterval`](https://developer.apple.com/documentation/combine/publishers/measureinterval)
  * [`Publishers.Merge`](https://developer.apple.com/documentation/combine/publishers/merge)
  * [`Publishers.Merge3`](https://developer.apple.com/documentation/combine/publishers/merge3)
  * [`Publishers.Merge4`](https://developer.apple.com/documentation/combine/publishers/merge4)
  * [`Publishers.Merge5`](https://developer.apple.com/documentation/combine/publishers/merge5)
  * [`Publishers.Merge6`](https://developer.apple.com/documentation/combine/publishers/merge6)
  * [`Publishers.Merge7`](https://developer.apple.com/documentation/combine/publishers/merge7)
  * [`Publishers.Merge8`](https://developer.apple.com/documentation/combine/publishers/merge8)
  * [`Publishers.MergeMany`](https://developer.apple.com/documentation/combine/publishers/mergemany)
  * [`Publishers.Multicast`](https://developer.apple.com/documentation/combine/publishers/multicast)
  * [`Publishers.Output`](https://developer.apple.com/documentation/combine/publishers/output)
  * [`Publishers.PrefixUntilOutput`](https://developer.apple.com/documentation/combine/publishers/prefixuntiloutput)
  * [`Publishers.PrefixWhile`](https://developer.apple.com/documentation/combine/publishers/prefixwhile)
  * [`Publishers.Print`](https://developer.apple.com/documentation/combine/publishers/print)
  * [`Publishers.ReceiveOn`](https://developer.apple.com/documentation/combine/publishers/receiveon)
  * [`Publishers.Reduce`](https://developer.apple.com/documentation/combine/publishers/reduce)
  * [`Publishers.RemoveDuplicates`](https://developer.apple.com/documentation/combine/publishers/removeduplicates)
  * [`Publishers.ReplaceEmpty`](https://developer.apple.com/documentation/combine/publishers/replaceempty)
  * [`Publishers.ReplaceError`](https://developer.apple.com/documentation/combine/publishers/replaceerror)
  * [`Publishers.Retry`](https://developer.apple.com/documentation/combine/publishers/retry)
  * [`Publishers.Scan`](https://developer.apple.com/documentation/combine/publishers/scan)
  * [`Publishers.Sequence`](https://developer.apple.com/documentation/combine/publishers/sequence)
  * [`Publishers.SetFailureType`](https://developer.apple.com/documentation/combine/publishers/setfailuretype)
  * [`Publishers.Share`](https://developer.apple.com/documentation/combine/publishers/share)
  * [`Publishers.SubscribeOn`](https://developer.apple.com/documentation/combine/publishers/subscribeon)
  * [`Publishers.SwitchToLatest`](https://developer.apple.com/documentation/combine/publishers/switchtolatest)
  * [`Publishers.Throttle`](https://developer.apple.com/documentation/combine/publishers/throttle)
  * [`Publishers.Timeout`](https://developer.apple.com/documentation/combine/publishers/timeout)
  * [`Publishers.TryAllSatisfy`](https://developer.apple.com/documentation/combine/publishers/tryallsatisfy)
  * [`Publishers.TryCatch`](https://developer.apple.com/documentation/combine/publishers/trycatch)
  * [`Publishers.TryCompactMap`](https://developer.apple.com/documentation/combine/publishers/trycompactmap)
  * [`Publishers.TryComparison`](https://developer.apple.com/documentation/combine/publishers/trycomparison)
  * [`Publishers.TryContainsWhere`](https://developer.apple.com/documentation/combine/publishers/trycontainswhere)
  * [`Publishers.TryDropWhile`](https://developer.apple.com/documentation/combine/publishers/trydropwhile)
  * [`Publishers.TryFilter`](https://developer.apple.com/documentation/combine/publishers/tryfilter)
  * [`Publishers.TryFirstWhere`](https://developer.apple.com/documentation/combine/publishers/tryfirstwhere)
  * [`Publishers.TryLastWhere`](https://developer.apple.com/documentation/combine/publishers/trylastwhere)
  * [`Publishers.TryMap`](https://developer.apple.com/documentation/combine/publishers/trymap)
  * [`Publishers.TryPrefixWhile`](https://developer.apple.com/documentation/combine/publishers/tryprefixwhile)
  * [`Publishers.TryReduce`](https://developer.apple.com/documentation/combine/publishers/tryreduce)
  * [`Publishers.TryRemoveDuplicates`](https://developer.apple.com/documentation/combine/publishers/tryremoveduplicates)
  * [`Publishers.TryScan`](https://developer.apple.com/documentation/combine/publishers/tryscan)
  * [`Publishers.Zip`](https://developer.apple.com/documentation/combine/publishers/zip)
  * [`Publishers.Zip3`](https://developer.apple.com/documentation/combine/publishers/zip3)
  * [`Publishers.Zip4`](https://developer.apple.com/documentation/combine/publishers/zip4)
  * [`Record`](https://developer.apple.com/documentation/combine/record)


## [See Also](https://developer.apple.com/documentation/Combine/Publisher#see-also)
### [Publishers](https://developer.apple.com/documentation/Combine/Publisher#Publishers)
[`enum Publishers`](https://developer.apple.com/documentation/combine/publishers)
A namespace for types that serve as publishers.
[`struct AnyPublisher`](https://developer.apple.com/documentation/combine/anypublisher)
A publisher that performs type erasure by wrapping another publisher.
[`struct Published`](https://developer.apple.com/documentation/combine/published)
A type that publishes a property marked with an attribute.
[`protocol Cancellable`](https://developer.apple.com/documentation/combine/cancellable)
A protocol indicating that an activity or action supports cancellation.
[`class AnyCancellable`](https://developer.apple.com/documentation/combine/anycancellable)
A type-erasing cancellable object that executes a provided closure when canceled.
Current page is Publisher 
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


To submit feedback on documentation, visit [Feedback Assistant](applefeedback://new?form_identifier=developertools.fba&answers%5B%3Aarea%5D=seedADC%3Adevpubs&answers%5B%3Adoc_type_req%5D=Technology%20Documentation&answers%5B%3Adocumentation_link_req%5D=https%3A%2F%2Fdeveloper.apple.com%2Fdocumentation%2FCombine%2FPublisher).
Select a color scheme preference
Light
Dark
Auto
Copyright © 2025 [Apple Inc.](https://www.apple.com) All rights reserved. 
[ Terms of Use ](https://www.apple.com/legal/internet-services/terms/site.html)[ Privacy Policy ](https://www.apple.com/legal/privacy/)[ Agreements and Guidelines ](https://developer.apple.com/support/terms/)
