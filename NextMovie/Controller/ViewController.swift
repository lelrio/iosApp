import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var posterView: PosterView!
    @IBAction func dragPosterView(_ sender: UIPanGestureRecognizer) {
        switch sender.state {
            case .began, .changed: transformPosterViewWith(gesture: sender)
            case .ended, .cancelled: setUserChoiceFrom(gesture: sender)
            default: break
        }
    }
    @IBOutlet var questionTitle: UILabel!
    
    var choice = Choice()
    
    override func viewDidLoad() {
        super.viewDidLoad()
                
    }
    
    private func transformPosterViewWith(gesture: UIPanGestureRecognizer){
        
        let gestureTranslation = gesture.translation(in: posterView)
        
        
        let translationTransform = CGAffineTransform(translationX: gestureTranslation.x, y: gestureTranslation.y)
        
        let screenWidth = UIScreen.main.bounds.width
        
        let ratioOfTranslationScreenWidth = gestureTranslation.x / (screenWidth / 2)
        
        let rotationAngle = (CGFloat.pi / 6) * ratioOfTranslationScreenWidth
        
        let rotationTransform = CGAffineTransform(rotationAngle: rotationAngle)
        
        let transform = translationTransform.concatenating(rotationTransform)
        
        posterView.transform = transform
        
        posterView.style = gestureTranslation.x > 0 ? .liked : .unliked
    }
    
    private func setUserChoiceFrom(gesture: UIPanGestureRecognizer) {
        //Récupération du geste et calcul du ration geste/(1/4 de la largeur de l’écran)
        let gestureTranslation = gesture.translation(in: posterView)
        let screenWidth = UIScreen.main.bounds.width
        let ratioOfTranslationAndScreenWidth = gestureTranslation.x / (screenWidth / 4)
        
        //Tout stopper si le geste n’est pas significatif
        guard ratioOfTranslationAndScreenWidth < -1 || ratioOfTranslationAndScreenWidth > 1 else {
            posterView.transform = .identity
            posterView.style = .neutral
            return
        }
        
        //Régler le choix de l’utilisateur pour le film en cours
        switch posterView.style {
            case .liked:
                print("false")
                choice.setResponse(Response.left)
            
        case .unliked: choice.setResponse(Response.right)
            default: break
            
        }
        
        //        Animer la sortie du posterView puis apparition du nouveau poster
        var translationTransform: CGAffineTransform
        //        var rotationTransform: CGAffineTransform
        //        let rotationAngle = CGFloat.pi / 6
        
        if posterView.style == .liked {
            //            rotationTransform = CGAffineTransform(rotationAngle: rotationAngle)
            translationTransform = CGAffineTransform(translationX: screenWidth, y: 0)
        } else {
            //            rotationTransform = CGAffineTransform(rotationAngle: -rotationAngle)
            translationTransform = CGAffineTransform(translationX: -screenWidth, y: 0)
        }
        //        let transform = translationTransform.concatenating(rotationTransform)
        
        UIView.animate(withDuration: 0.3, animations: {
            self.posterView.transform = translationTransform
        }) { (success) in
            guard success else { return }
            self.showPoster()
        }
    }
    private func showPoster() {
        //Replacer le posterView à sa place d’origine et passer au film suivant
        posterView.transform = .identity
        posterView.style = .neutral
        
        switch choice.state {
        case .ongoing:
            self.questionTitle.text = choice.currentQuestion.questionTitle
            posterView.textLeftLabel.text = choice.currentQuestion.textLeft
            posterView.textRightLabel.text = choice.currentQuestion.textRight
            posterView.imgLeftIV.image = choice.currentQuestion.imgLeft
            posterView.imgRightIV.image = choice.currentQuestion.imgRight
            
        case .over:
            print("over")
            
            var gauche = 2
            var droite = 12
            
            enum Style{
                case liked, unliked, neutral
                
            }
            
            var style: Style = .neutral{
              
                didSet{
                    switch style{
                    case .liked:
                        droite += 1
                        print("droite")
                    case .unliked:
                        gauche += 1
                        print("gauche")
                        print(gauche)
                    case .neutral:
                        print("neutre")
                    }
                    
                }

            }
            if(gauche > droite) {
                self.performSegue(withIdentifier: "dataPassingAndResultOne", sender: self)
            }
            else if(droite > gauche){
                self.performSegue(withIdentifier: "dataPassingAndResultTwo", sender: self)
            }
            
        }
        
        //    Animer l’apparition du posterView
        posterView.transform = CGAffineTransform(scaleX: 0.01, y: 0.01)
        
        UIView.animate(withDuration: 0.4, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 4, options: [], animations: {
            self.posterView.transform = .identity
        })
    }


}

