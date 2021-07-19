//
//  customTableViewCell.swift
//  MovieListingApp
//
//  Created by Akanksha on 14/07/21.
//

import UIKit

class customTableViewCell: UITableViewCell {

    @IBOutlet weak var moviePoster: UIImageView!
    @IBOutlet weak var movieTitle: UILabel!
    @IBOutlet weak var movieOverview: UILabel!
    
    @IBAction func movieBookAction(_ sender: Any) {
        print("Button Tapped!")
    }
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }
    
}
