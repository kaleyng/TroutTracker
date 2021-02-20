import UIKit

class Item: NSObject, NSCoding {
    var type: String
    var location: String
    var size: String
    var fly: String
    var dateCaught: String
    var comments: String?
    let itemKey: String
    var title: String
    
    init(type: String, size: String, fly: String, location: String, dateCaught: String, comments: String?) {
        self.type = type
        self.size = size
        self.fly = fly
        self.location = location
        self.dateCaught = dateCaught
        self.comments = comments
        self.itemKey = UUID().uuidString
        self.title = self.size + " inch " + self.type

        super.init()
    }
    
    required init?(coder aDecoder: NSCoder) {
        type = aDecoder.decodeObject(forKey: "type") as! String
        size = aDecoder.decodeObject(forKey: "size") as! String
        fly = aDecoder.decodeObject(forKey: "fly") as! String
        dateCaught = aDecoder.decodeObject(forKey: "dateCaught") as! String
        comments = aDecoder.decodeObject(forKey: "comments") as! String?
        itemKey = aDecoder.decodeObject(forKey: "itemKey") as! String
        location = aDecoder.decodeObject(forKey: "location") as! String
        title = aDecoder.decodeObject(forKey: "title") as! String
        
        super.init()
    }
    
    convenience init(forced: Bool = false) {
        if forced {
            self.init(type: "Rainbow Trout", size: "18", fly: "Wooly Bugger", location: "Owyhee", dateCaught: "7/11/2017", comments: "Neat")
        } else {
            self.init(type: "", size: "", fly: "", location: "", dateCaught: "", comments: "")
        }
    }
    
    func setTitle() {
        self.title = self.size + " inch " + self.type
    }
    
    func encode(with aCoder: NSCoder) {
        aCoder.encode(type, forKey: "type")
        aCoder.encode(size, forKey: "size")
        aCoder.encode(fly, forKey: "fly")
        aCoder.encode(location, forKey: "location")
        aCoder.encode(dateCaught, forKey: "dateCaught")
        aCoder.encode(comments, forKey: "comments")
        aCoder.encode(itemKey, forKey: "itemKey")
        aCoder.encode(title, forKey: "title")
    }
}
