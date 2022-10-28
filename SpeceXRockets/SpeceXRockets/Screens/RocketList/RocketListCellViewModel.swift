//
//  RocketListViewModel.swift
//  SpeceXRockets
//
//  Created by Hüseyin HÖBEK on 30.09.2022.
//

import Foundation


class RocketListViewModel {
    
    private var response: [RocketResponse] = []
    var cellViewModels: [RocketListCellViewModel] = []
    var rockets : [RocketResponse] = []
    func getData (complationHandler: @escaping () -> Void) {
        self.getRockets(completion: { [weak self] rocketList in
            guard let self = self else {return}
            if rocketList != nil {
                self.response = rocketList!
                self.response.forEach { rocket in
                    let cellViewModel = RocketListCellViewModel(name: rocket.name ?? "",
                                                                description: rocket.welcomeDescription ?? "",
                                                                image: rocket.flickrImages?.first ?? "")
                    self.cellViewModels.append(cellViewModel)
                }
                complationHandler()
            } else {
                print("Error")
            }
        })
    }

func getRockets (completion: @escaping ([RocketResponse]?) -> ()) {
    
    guard let url = URL(string: "https://api.spacexdata.com/v4/rockets") else {
        return
    }
    
    
    let request = URLRequest(url: url)
    URLSession.shared.dataTask(with: request) { data, response, error in
        
        if let error = error {
            debugPrint(error)
                completion(nil)
        }
        if let data = data {
            do {
                let response = try JSONDecoder().decode([RocketResponse].self, from: data)
                completion(response)
                
            } catch {
                print(error)
            }
        }
    }.resume()
    }
}



struct RocketListCellViewModel {
    let name: String
    let description: String
    let image: String
    
    init(name: String, description: String, image: String) {
        self.name = name
        self.description = description
        self.image = image
    }
    
}
