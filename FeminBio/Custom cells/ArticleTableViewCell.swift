//
//  ArticleTableViewCell.swift
//  FeminBio
//
//  Created by Walid Sassi on 10/02/2018.
//  Copyright © 2018 Walid Sassi. All rights reserved.
//

import UIKit
import Alamofire
class ArticleTableViewCell: UITableViewCell {
  @IBOutlet weak var articleImageView: UIImageView!
  @IBOutlet weak var ArticleRubricLabel: UILabel!
  @IBOutlet weak var articleTitleLabel: UILabel!
  override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
  func configCell ( myArticle:Article){
    articleTitleLabel.text = myArticle.title
    ArticleRubricLabel.text = myArticle.rubric.name
    self.DownloadImage(imageLink: myArticle.image.link)
  }
  
  func DownloadImage(imageLink:String){
    Alamofire.request(imageLink)
      .response { response in
       
        guard let imageData = response.data else {
          print("Could not get image from image URL returned in search results")
          return
        }
        self.articleImageView.image = UIImage(data: imageData)
    }
  }
  

}


