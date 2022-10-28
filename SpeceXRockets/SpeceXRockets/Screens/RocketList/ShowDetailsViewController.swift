//
//  ShowDetailsViewController.swift
//  SpeceXRockets
//
//  Created by Hüseyin HÖBEK on 1.10.2022.
//

import Kingfisher
import UIKit

class ShowDetailsViewController: UIViewController {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var likeButton: UIImageView!
    @IBOutlet weak var discriptionLabel: UILabel!
    @IBOutlet weak var rocketName: UILabel!
    
    var detailName: RocketResponse!
   
    
    var rocket: RocketResponse?
    override func viewDidLoad() {
        super.viewDidLoad()
        //setInıtViews()
       rocketName.text = rocket?.name
       discriptionLabel.text = rocket?.welcomeDescription
        
       let imageUrl = URL(string: "\(rocket?.flickrImages?.first ?? "")")
        imageView.kf.setImage(with: imageUrl)
        
       
      
    
    //private func setInıtViews() {
      //  rocketName.text = detailName.name
        }
    }
    
    
    /*
     
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     return 5
     }
     
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
     let cell = tableView.dequeueReusableCell(withIdentifier: "RocketListCell", for: indexPath) as! RocketListCell
     if let cellViewModel = viewmodel?.cellViewModels[indexPath.row] {
     cell.viewModel = cellViewModel
     return cell
     } else {
     return UITableViewCell()
     }
     }
     }
     
     
     */
