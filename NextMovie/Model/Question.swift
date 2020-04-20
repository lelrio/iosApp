import UIKit

class Question{
    
    var questionTitle: String
    var imgRight: UIImage?
    var imgLeft: UIImage?
    var textRight: String
    var textLeft: String
    var toLeft: Formation
    var toRight: Formation
    
    init(questionTitle: String, imgRight: UIImage, imgLeft:UIImage, textRight: String, textLeft: String, toRight: Formation, toLeft: Formation ){
        self.questionTitle = questionTitle
        self.imgRight = imgRight
        self.imgLeft = imgLeft
        self.textLeft = textLeft
        self.textRight = textRight
        self.toLeft = toLeft
        self.toRight = toRight
    }
}
