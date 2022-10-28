//
//  FavoritesListCell.swift
//  SpeceXRockets
//
//  Created by Hüseyin HÖBEK on 3.10.2022.
//

import Foundation
import UIKit
import Kingfisher


class FavoritesListCell: UITableViewCell {
    

    @IBOutlet weak var favoriLabel: UILabel!
    
    @IBOutlet weak var rocketLabel: UILabel!
    
    
    var viewModel: RocketListCellViewModel? {
        didSet {
            bindViewModel()
        }
    }
    func bindViewModel () {
        guard let viewModel = viewModel else {return}
        
        self.favoriLabel.text = viewModel.name
        
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    
    
}
