//
//  FakeApi.swift
//  ReactiveDemo
//
//  Created by Patel, Ashish on 2/5/16.
//  Copyright © 2016 Patel, Ashish. All rights reserved.
//

import Foundation
import RxSwift


class FakeApi: NSObject {
    
    static func getUserObservable() -> Observable<User> {
        return Observable.create({ (observer: AnyObserver<User>) -> Disposable in
            
            let user = fetchUserFromNetwork().user
            if let user = user{
                observer.on(.Next(user))
            }
            observer.on(.Completed)
            return AnonymousDisposable{
                
            }
        })
    }
    
    
    static func getFriendsObservable(userID: String) -> Observable<User> {
        return Observable.create({ (observer: AnyObserver<User>) -> Disposable in
            
            for jsonUser in fetchFriendsFromNetworkFor(userID).friends{
                observer.onNext(jsonUser)
            }
            
            observer.onCompleted()
            return AnonymousDisposable{
                
            }
        })
    }
    
    private static func fetchUserFromNetwork() -> FakeJSONResponse{
        return FakeJSONResponse()
    }
    
    private static func fetchFriendsFromNetworkFor(userId: String) -> FakeJSONResponse{
        return FakeJSONResponse()
    }
    
    class FakeJSONResponse {
        var friends = [User]()
        var user: User?
        init(){
            let ashish = User(userId: "Ashish", password: "password", phoneNumber: "3333333333")
            let sagar = User(userId: "Sagar", password: "password", phoneNumber: "22222222222")
            let abhi = User(userId: "Abhi", password: "password", phoneNumber: "44444444444")
            let john = User(userId: "John", password: "password", phoneNumber: "33333334343434")
            
            user = ashish
            friends.append(sagar)
            friends.append(abhi)
            friends.append(john)
        }
    }
}
