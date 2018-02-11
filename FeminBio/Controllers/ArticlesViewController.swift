//
//  ViewController.swift
//  FeminBio
//
//  Created by Walid Sassi on 10/02/2018.
//  Copyright © 2018 Walid Sassi. All rights reserved.
//

import UIKit

class ArticlesViewController: UIViewController {
var articles = [Article]()
  
  @IBOutlet weak var articlesTableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    RunAPI()
    articlesTableView.dataSource = self
    articlesTableView.delegate = self
    // Do any additional setup after loading the view, typically from a nib.
 
  }
  
  override func didReceiveMemoryWarning() {
    super.didReceiveMemoryWarning()
    // Dispose of any resources that can be recreated.
  }
  func RunAPI()
  {
    let api = APIManager()
    api.loadData(urlString: "https://www.femininbio.com/json/liste-articles",completion:didloadData)
  }
  // handling the call back
  func didloadData(articles:[Article])
  {
    self.articles = articles
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
    self.navigationController?.pushViewController((self.storyboard?.instantiateViewController(withIdentifier: "ArticlesdetailsVC"))!, animated: true)
  }
}

