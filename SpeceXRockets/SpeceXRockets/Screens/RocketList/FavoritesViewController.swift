//
//  FavoritesViewController.swift
//  SpeceXRockets
//
//  Created by Hüseyin HÖBEK on 3.10.2022.
//
import UIKit
import Foundation


class FavoritesViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    
    @IBOutlet weak var tableView: UITableView!
    
    var rocket: RocketResponse?
    var viewModel: FavoritesViewModel?
    var favRocket = [Int:Bool]()
    var response: [RocketResponse] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        viewModel = FavoritesViewModel()
        fetchRecentRockets()
        
        
    }
    
    private func blankFavorite() {
        for i in 0...response.count {
            favRocket[i] = false
        }
    }
    
    private func fetchRecentRockets() {
        
        viewModel?.getRockets(completion: { [weak self] rocketList in
            if rocketList != nil {
                self?.response = rocketList!
                
            } else {
                print("error")
            }
        })
    }
    
    
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.response.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "FavoritesListCell", for: indexPath) as! FavoritesListCell
        if favRocket[indexPath.row] == true {
            cell.rocketLabel.text = rocket?.name
        } else {
            cell.rocketLabel.text = "selam"
        }
        return cell
    }
    
    
    
}
