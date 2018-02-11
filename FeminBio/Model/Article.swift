//
//  Article.swift
//  FeminBio
//
//  Created by Walid Sassi on 10/02/2018.
//  Copyright © 2018 Walid Sassi. All rights reserved.
//

import Foundation

struct articleAuthor{
  private var _name:String?
  //getter
  var name:String{
    return _name!
  }
  //constructor
  init( name:String){
    self._name = name
  }
}
  extension articleAuthor:Decodable{
    enum ArticleAuthorkeys:String, CodingKey{
      case authorName = "n"
    }
    init(from decoder: Decoder) throws {
      let container = try decoder.container(keyedBy: ArticleAuthorkeys.self)
      let authorName = (try? container.decode(String.self, forKey: .authorName)) ?? ""
      self.init(name:authorName)
    }
}
struct articleRubric{
  private var _name: String
  //getter
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
  private var _author : articleAuthor
  private var _date: Date
  private var _description: String
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
  var author:articleAuthor{
    return _author
  }
  var date:Date {
    return _date
  }
  var description:String{
    return _description
  }
  //Constructor
  init (id:Int, title:String, image:articleImage, rubric:articleRubric, author:articleAuthor, date: Int64, description:String){
    self._id = id
    self._title = title
    self._image = image
    self._rubric = rubric
    self._author = author
    self._date = Date(timeIntervalSince1970: TimeInterval(date))
    self._description = description
  }
}

extension Article : Decodable{
  enum ArticleKeys : String, CodingKey{
    case id = "id"
    case title = "t"
    case image = "i"
    case rubric = "r"
    case author = "a"
    case timestamp = "d"
    case description = "ch"
  }
  init(from decoder: Decoder) throws {
    let container = try decoder.container(keyedBy: ArticleKeys.self) // defining our (keyed) Article
    let id: Int = try container.decode(Int.self, forKey: .id) // extracting the id
    let title: String = try container.decode(String.self, forKey: .title) // extracting the article title
    let image:articleImage = try container.decode(articleImage.self, forKey:.image) // extracting the image data
    let rubric : articleRubric = try container.decode(articleRubric.self, forKey: .rubric)
    let author : articleAuthor = try container.decode(articleAuthor.self, forKey: .author)
    let timestamp : Int64 = try container.decode(Int64.self, forKey: .timestamp )
    let description : String = try container.decode(String.self, forKey: .description)
    self.init(id: id, title: title, image:image,rubric:rubric,author:author, date:timestamp , description: description ) // initializing our Article struct
  }
}
