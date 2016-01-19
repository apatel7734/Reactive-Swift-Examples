//: Playground - noun: a place where people can play

import UIKit
import RxSwift

var c: String = ""

var a = 1
var b = 2

if a + b > 0{
    c = "\(a+b) is Positive."
}

a = 4

print("\(c)")


// ----- variable binding ------

let rxA = Variable(1)
let rxB = Variable(2)

let cObservable = Observable<Int>.combineLatest(rxA.asObservable(), rxB.asObservable()) { (firstValue, secondValue) -> Int in
    return firstValue + secondValue
}.filter { (input) -> Bool in
    return input > 0 ? true: false
}.map { (input) -> String in
    return "Map : \(input) is positive"
}

//Subscribe to value change.
cObservable.subscribeNext { (input: String) -> Void in
    print("SubscribeNext = \(input)")
}

rxA.value = 4

rxA.value = -8