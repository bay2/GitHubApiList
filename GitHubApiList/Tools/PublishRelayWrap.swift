//
//  PublishRelay.swift
//  GitHubApiList
//
//  Created by Sim Tsai on 2020/12/23.
//


import Foundation
import RxSwift
import RxCocoa
import RxRelay


@propertyWrapper
public struct PublishRelayWrap<Value> {
    
    var observed: RxRelay.PublishRelay<Value>
    
    // swiftlint:disable:next identifier_name
    var _value: Value
    
    public init(wrappedValue: Value) {
        self.observed = RxRelay.PublishRelay()
        _value = wrappedValue
    }
    
    public var wrappedValue: Value {
        get { _value }
        set {
            _value = newValue
            self.observed.accept(newValue)
        }
    }
    
    public var projectedValue: Self {
        get { self }
        set { self = newValue }
    }

}

extension PublishRelayWrap: ObservableType {
    // swiftlint:disable:next colon
    public func subscribe<Observer>(_ observer: Observer) -> Disposable where Observer : ObserverType, Self.Element == Observer.Element {
        self.observed.subscribe(observer)
    }

    public typealias Element = Value

}

extension ObservableType {
    public func bind(to codPublishRelay: PublishRelayWrap<Element>) -> Disposable {
        bind(to: codPublishRelay.observed)
    }
}


