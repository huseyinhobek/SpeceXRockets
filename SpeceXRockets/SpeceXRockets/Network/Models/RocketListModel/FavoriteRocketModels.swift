//
//  FavoriteRocketModels.swift
//  SpeceXRockets
//
//  Created by Hüseyin HÖBEK on 8.10.2022.
//

import UIKit

enum FavoriteRockets {
    enum Favorite {
        struct Request {
        }
        struct Response {
            var rockets: [RocketResponse]
        }
        struct ViewModel {
            struct DisplayedRocket {
                var id : Int
                var rocketId : String
                var rocketName : String
                var description : String
                var flickPaths : [String]
            }
            var displayedRocket: [DisplayedRocket]
        }
    }
}
