//
//  Article.swift
//  FeminBio
//
//  Created by Walid Sassi on 10/02/2018.
//  Copyright © 2018 Walid Sassi. All rights reserved.
//

import Foundation

struct articleRubric{
  private var _name: String
  //getters
  var name:String{
    return _name
  }
  //constructor
  init( name:String){
    self._name = name
  }
}
extension articleRubric: Decodable {
  enum ArticleRubrickeys: String, CodingKey{
    case name = "n"
  }
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ArticleRubrickeys.self)
    let name = try container.decode(String.self, forKey: .name)
    self.init(name:name)
  }
}


struct articleImage{
  private var _link:String
  //getter
  var link:String {
    return _link
  }
  //constructor
  init (link:String){
    self._link = link
  }
}
extension articleImage: Decodable{
  enum ArticleImageKeys : String, CodingKey{
    case imageLink = "u"
  }
   init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ArticleImageKeys.self)
    let imageLink = try container.decode(String.self, forKey: .imageLink)
    self.init(link: imageLink)
  }
}
struct Article {
  private var _id : Int
  private var _title:String
  private var _image:articleImage
  private var _rubric: articleRubric
  var id:Int {
    return _id
  }
  var title:String {
    return _title
  }
  var image:articleImage{
    return _image
  }
  var rubric:articleRubric{
    return _rubric
  }
  //Constructor
  init (id:Int, title:String, image:articleImage, rubric:articleRubric){
    self._id = id
    self._title = title
    self._image = image
    self._rubric = rubric
  }
}

extension Article : Decodable{
  enum ArticleKeys : String, CodingKey{
    case id = "id"
    case title = "t"
    case image = "i"
    case rubric = "r"
  }
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ArticleKeys.self) // defining our (keyed) Article
    let id: Int = try container.decode(Int.self, forKey: .id) // extracting the id
    let title: String = try container.decode(String.self, forKey: .title) // extracting the article title
    let image:articleImage = try container.decode(articleImage.self, forKey:.image) // extracting the image data
    let rubric : articleRubric = try container.decode(articleRubric.self, forKey: .rubric)
    self.init(id: id, title: title, image:image,rubric:rubric) // initializing our Article struct
  }
}
