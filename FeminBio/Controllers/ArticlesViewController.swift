//
//  ViewController.swift
//  FeminBio
//
//  Created by Walid Sassi on 10/02/2018.
//  Copyright © 2018 Walid Sassi. All rights reserved.
//

import UIKit
import MBProgressHUD
class ArticlesViewController: UIViewController {
var articles = [Article]()
let network: NetworkManager = NetworkManager.sharedInstance
  @IBOutlet weak var articlesTableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // If the network is unreachable show empty page
    NetworkManager.isUnreachable { _ in
      let alertController = UIAlertController(title: "Alert!", message: "Vérifier votre connexion Internet", preferredStyle: UIAlertControllerStyle.alert)
      alertController.addAction(UIAlertAction(title: "Fermer", style: UIAlertActionStyle.default,handler: nil))
      self.present(alertController, animated: true, completion: nil)
      self.articlesTableView.isHidden = true
    }
      RunAPI()
      self.articlesTableView.dataSource = self
      self.articlesTableView.delegate = self
    }
    // Do any additional setup after loading the view, typically from a nib.
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  func RunAPI()
  {
    let api = APIManager()
    api.loadData(urlString: "https://www.femininbio.com/json/liste-articles",completion:didloadData)
    DispatchQueue.main.async {
      MBProgressHUD.showAdded(to: self.view, animated: true)
    }
  }
  // handling the call back
  func didloadData(articles:[Article])
  {
    self.articles = articles
    DispatchQueue.main.async {
      MBProgressHUD.hide(for: self.view, animated: true)
    }
    articlesTableView.reloadData()
  }
}
//MARK: TableView Delegates
extension ArticlesViewController: UITableViewDelegate,UITableViewDataSource {
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return self.articles.count
  }
  func numberOfSectionsInTableView(tableView: UITableView) -> Int {
    return 1
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "Cell") as! ArticleTableViewCell
    cell.configCell(myArticle: self.articles[indexPath.row])
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    let ArticleDetailsVC = storyboard?.instantiateViewController(withIdentifier: "ArticlesdetailsVC") as! ArticlesDetailsViewControllers
    ArticleDetailsVC.article = self.articles[indexPath.row]
    self.navigationController?.pushViewController(ArticleDetailsVC, animated: true)
  }
}

