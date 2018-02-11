//
//  ArticlesDetailsViewControllers.swift
//  FeminBio
//
//  Created by Walid Sassi on 10/02/2018.
//  Copyright © 2018 Walid Sassi. All rights reserved.
//

import UIKit

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
    let dateFormatter = DateFormatter()
    dateFormatter.dateFormat = "dd-MM-YYYY"
    dateFormatter.timeStyle = DateFormatter.Style.none
    dateFormatter.dateStyle = DateFormatter.Style.medium
    self.articleDateLabel.text = dateFormatter.string(from: (article?.date)!)
    self.articleAuthorLabel.text = article?.author.name
    self.articleTitleLabel.text = article?.title
    self.articleDetailsLabel.text = article?.description
        // Do any additional setup after loading the view.
    }
  
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
