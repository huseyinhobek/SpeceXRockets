//
//  RocketListCell.swift
//  SpeceXRockets
//
//  Created by Hüseyin HÖBEK on 30.09.2022.
//

import Foundation
import UIKit
import Kingfisher


class RocketListCell: UITableViewCell {
    

    @IBOutlet weak var likeButton: UIImageView!
    @IBOutlet weak var rocketImageView: UIImageView!
    @IBOutlet weak var rocketNameLabel: UILabel!
    @IBOutlet weak var rocketDescriptionLabel: UILabel!
    
    @IBOutlet weak var favButton: UIButton!
    
    var id: Int!
    var indexPath: IndexPath?
    var favoriteAction : (IndexPath) -> () = { _ in }

    
    
    var viewModel: RocketListCellViewModel? {
        didSet {
            bindViewModel()
        }
    }
    func bindViewModel () {
        guard let viewModel = viewModel else {return}
        if let url = URL(string: viewModel.image) {
            self.rocketImageView.kf.setImage(with: url)
        }
        self.rocketNameLabel.text = viewModel.name
        self.rocketDescriptionLabel.text = viewModel.description
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
    
   /* fileprivate func setFavoriteButtonImage() {
        if getCheckFavoriteRocket(rocketId: self.id) {
            favButton.setImage(UIImage(named: "48"), for: .normal)
        } else {
            favButton.setImage(UIImage(named: "favv"), for: .normal)
        }
    }
    */
    
  
    
    @IBAction func favButtonClicked(_ sender: Any) {
   
        
        
    //
        
        /*
        guard let indexpath = self.indexPath else {
            return
        }
        favoriteAction(indexpath)
         */

    //
        if likeButton.tag == 0 //empty
        {
           //favButton.setImage(UIImage(named: "empty"), for: .normal)
            likeButton.image = UIImage(named: "like")
            likeButton.tag = 1
            print("clicked")
        } else {
            likeButton.image = UIImage(named: "empty")

            //favButton.setImage(UIImage(named: "like"), for: .normal)
            favButton.tag = 0
            print("non clicked")
        }
       
        
    }
    
    
    
}
