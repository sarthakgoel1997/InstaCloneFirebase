//
//  FeedCell.swift
//  InstaCloneFirebase
//
//  Created by Sarthak Goel on 02/04/23.
//

import UIKit
import FirebaseFirestore

class FeedCell: UITableViewCell {

    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var commentLabel: UILabel!
    @IBOutlet weak var likeLabel: UILabel!
    @IBOutlet weak var documentIdLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

    @IBAction func likeButtonClicked(_ sender: Any) {
        let firestoreDatabase = Firestore.firestore()
        
        if let likesCount = Int(likeLabel.text!) {
            let dataDictionary = ["likes": likesCount+1] as [String : Any]
            
            firestoreDatabase.collection("Posts").document(documentIdLabel.text!).setData(dataDictionary, merge: true)
        }
    }
}
