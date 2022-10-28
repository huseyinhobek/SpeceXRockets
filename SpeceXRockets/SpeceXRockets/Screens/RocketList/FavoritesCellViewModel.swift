//
//  FavoritesCellViewModel.swift
//  SpeceXRockets
//
//  Created by Hüseyin HÖBEK on 4.10.2022.
//

import Foundation

class FavoritesViewModel {
    
    private var response: [RocketResponse] = []
    
    var cellViewModels: [FavoritesCellViewModel] = []
    var rockets : [RocketResponse] = []
    
    func getData (complationHandler: @escaping () -> Void) {
        self.getRockets(completion: { [weak self] rocketList in
            guard let self = self else {return}
            if rocketList != nil {
                self.response = rocketList!
                self.response.forEach { rocket in
                    let cellViewModel = FavoritesCellViewModel(name: rocket.name ?? "")
                    self.cellViewModels.append(cellViewModel)
                }
                complationHandler()
            } else {
                print("error")
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




struct FavoritesCellViewModel {
    let name: String
    
    
    init(name: String) {
        self.name = name
        
    }
    
}
