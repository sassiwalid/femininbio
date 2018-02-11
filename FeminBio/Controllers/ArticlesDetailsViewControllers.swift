//
//  ArticlesDetailsViewControllers.swift
//  FeminBio
//
//  Created by Walid Sassi on 10/02/2018.
//  Copyright © 2018 Walid Sassi. All rights reserved.
//

import UIKit
import Alamofire
class ArticlesDetailsViewControllers: UIViewController {
  var article: Article? = nil
  //MARK: Outlets
  @IBOutlet weak var articleDateLabel: UILabel!
  @IBOutlet weak var articleAuthorLabel: UILabel!
  @IBOutlet weak var articleDetailsLabel: UILabel!
  @IBOutlet weak var articleTitleLabel: UILabel!
  @IBOutlet weak var ArticleImageView: UIImageView!
  
  convenience init (article:Article){
    self.init()
    self.article = article
  }
  
  override func viewDidLoad() {
        super.viewDidLoad()
    initData()
    DownloadImage(imageLink: (self.article?.image.link)!)
        // Do any additional setup after loading the view.
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
  func initData(){
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-YYYY"
    dateFormatter.locale = Locale(identifier: "fr_FR")
    dateFormatter.timeStyle = DateFormatter.Style.none
    dateFormatter.dateStyle = DateFormatter.Style.medium
    self.articleDateLabel.text = dateFormatter.string(from: (article?.date)!)
    self.articleAuthorLabel.text = article?.author.name
    self.articleTitleLabel.text = article?.title
    self.articleDetailsLabel.text = article?.description
  }
  func DownloadImage(imageLink:String){
    Alamofire.request(imageLink)
      .response { response in
        
        guard let imageData = response.data else {
          print("Could not get image from image URL returned in search results")
          return
        }
        self.ArticleImageView.image = UIImage(data: imageData)
    }
  }

}
