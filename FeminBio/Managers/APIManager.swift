//
//  APIManager.swift
//  FeminBio
//
//  Created by Walid Sassi on 10/02/2018.
//  Copyright © 2018 Walid Sassi. All rights reserved.
//

import Foundation
class APIManager
{
  func loadData (urlString:String, completion:@escaping (_ result:[Article])->())
  {
    let url = URL(string:urlString)
    URLSession.shared.dataTask(with: url!){ (data,response,error) in
      if error == nil {
        var articles = [Article]()
        do{
        articles = try JSONDecoder().decode([Article].self, from: data!)
          DispatchQueue.main.async {
            completion(articles)
          }
        }catch{
          print("JSON Error")
        }
      }
    }.resume()
  }
}
