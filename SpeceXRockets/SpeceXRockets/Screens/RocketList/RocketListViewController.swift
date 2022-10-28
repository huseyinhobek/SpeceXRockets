//
//  ViewController.swift
//  SpeceXRockets
//
//  Created by Hüseyin HÖBEK on 30.09.2022.
//

import UIKit
import Kingfisher

class RocketListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    
    @IBOutlet weak var tableView: UITableView!
    var viewModel: RocketListViewModel?
    var response: [RocketResponse] = [] {
        didSet {
            DispatchQueue.main.async {
                self.tableView.reloadData()
            }
        }
    }
    
    var selectedRocket: RocketResponse!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.delegate = self
        tableView.dataSource = self
        viewModel = RocketListViewModel()
        fetchRecentRockets()
        
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
        1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return response.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "RocketListCell", for: indexPath) as! RocketListCell
        
        let rocket = response[indexPath.row]
        let url = URL(string: (rocket.flickrImages?[0])!)
        cell.rocketImageView.kf.setImage(with: url)
        cell.rocketNameLabel.text = rocket.name
        cell.rocketDescriptionLabel.text = rocket.welcomeDescription
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        let detailVC = self.storyboard?.instantiateViewController(withIdentifier: "goDetails") as! ShowDetailsViewController
        selectedRocket = response[indexPath.row]
        //self.navigationController?.pushViewController(detailVC, animated: true)
        
        performSegue(withIdentifier: "goDetailsView", sender: nil)
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "goDetailsView" {
            let destinationVC = segue.destination as? ShowDetailsViewController
            destinationVC?.rocket = selectedRocket
            
        }
    }
}
