import UIKit

class PosterView: UIView {
    @IBOutlet weak var imgRightIV: UIImageView!
    @IBOutlet weak var imgLeftIV: UIImageView!
    @IBOutlet var textLeftLabel: UILabel!
    @IBOutlet var textRightLabel: UILabel!
    
    var gauche = 0
    var droite = 0
    
    enum Style{
        case liked, unliked, neutral
        
    }
    
    var style: Style = .neutral{
      
        didSet{
            switch style{
            case .liked: backgroundColor = UIColor.colorGreen
            print("droite")

            case .unliked: backgroundColor = UIColor.colorRed
                gauche += 1
                print("gauche")
                print(gauche)
                
            case .neutral: backgroundColor = UIColor.mcBlack
                droite += 1
                print("neutre")
                print(droite)
            }
        }

    }
}
