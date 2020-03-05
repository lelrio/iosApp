import UIKit

class PosterView: UIView {

    @IBOutlet private var imageView: UIImageView!
    
    enum Style{
        case liked, unliked, neutral
        
    }
    
    var style: Style = .neutral{
      
        didSet{
            switch style{
            case .liked: backgroundColor = UIColor.colorGreen
            case .unliked: backgroundColor = UIColor.colorRed
            case .neutral: backgroundColor = UIColor.mcBlack
            }
        }

    }

    var poster = Data(){
        didSet{
            imageView.image = UIImage(data: poster)
        }
    }

}
