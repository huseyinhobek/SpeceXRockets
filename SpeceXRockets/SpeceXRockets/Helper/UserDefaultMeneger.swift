//
//  UserDefaultMeneger.swift
//  SpeceXRockets
//
//  Created by Hüseyin HÖBEK on 8.10.2022.
//

import Foundation
import UIKit

func addFavoriteRocket (rocketId:Int) {
    return UserDefaultManager.instance.addFavoriteRocket(rocketId: rocketId)
}

func removeFavoriteRocket(rocketId:Int) {
    return UserDefaultManager.instance.removeFavoriteRocket(rocketId: rocketId)
}

func getCheckFavoriteRocket(rocketId:Int) -> Bool {
    return UserDefaultManager.instance.getCheckFavoriteRockets(rocketId: rocketId)
}

func getFavoriteRockets() -> [Int]? {
    return UserDefaultManager.instance.getAllFavoriteRockets()

        
}


class UserDefaultManager {
    
    
    private let userDefaults = UserDefaults.standard
    private let favoriteRocketKey = "FavoriteRocketKey"
    
    static let instance = UserDefaultManager()
    
    var saveInUserDefaults: Bool {
        get {
            return (userDefaults.object(forKey: favoriteRocketKey) != nil)
        }
    }
    
    init() {}
    
    fileprivate func getCheckFavoriteRockets(rocketId : Int) -> Bool {
        if saveInUserDefaults {
            if let favoriteList = userDefaults.object(forKey: favoriteRocketKey) as? Int {
                return (favoriteList.words.firstIndex(where: {$0 == rocketId}) != nil)
            }
            return false
        }
        return false
    }
    
    func getAllFavoriteRockets() -> [Int]? {
        if saveInUserDefaults {
            return userDefaults.object(forKey: favoriteRocketKey) as? [Int]
        }
        return nil
    }
    
    fileprivate func addFavoriteRocket(rocketId: Int) {
        if saveInUserDefaults{
            if var rockets = getAllFavoriteRockets() {
                rockets.append(rocketId)
                userDefaults.set(rockets, forKey: favoriteRocketKey)
                userDefaults.synchronize()
            }
        }
    }
    
    fileprivate func removeFavoriteRocket(rocketId:Int) {
        if saveInUserDefaults {
            if var rockets = getAllFavoriteRockets() {
                let index = rockets.firstIndex(where: { $0 == rocketId})!
                rockets.remove(at: index)
                userDefaults.removeObject(forKey: favoriteRocketKey)
                userDefaults.synchronize()
                userDefaults.set(rockets, forKey: favoriteRocketKey)
                userDefaults.synchronize()
                
            }
        }
    }
    
    fileprivate func removeRocket(rocketId:String) {
        
        userDefaults.set([], forKey: favoriteRocketKey)
        userDefaults.removeObject(forKey: favoriteRocketKey)
        userDefaults.synchronize()
    }
}
