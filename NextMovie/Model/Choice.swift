import UIKit

class Choice {
    private var currentIndex = 0
    private let questions: [Question] = [
        Question(questionTitle: "Pour vous les réseaux c'est ?",
                 imgRight: UIImage(named: "shrug")!,
                 imgLeft: UIImage(named: "selfie")!,
                 textRight: "j'ai zappé mon mot de passe",
                 textLeft: "4 stories minimum par jour",
                 toRight: .pratique,
                 toLeft: .theorique
            ),
    
        Question(questionTitle: "Pour toi les nouvelles technologies c'est ...",
                 imgRight: UIImage(named: "money")!,
                 imgLeft: UIImage(named: "nerd")!,
                 textRight: "Le dernier iphone",
                 textLeft: "Une passion",
                 toRight: .pratique,
                 toLeft: .theorique
             ),
        
        Question(questionTitle: "Niveau organisation t'es plutôt ...",
            imgRight: UIImage(named: "rolling")!,
            imgLeft: UIImage(named: "female")!,
            textRight: "C'est pas demain la journée portes ouvertes ?",
            textLeft: "Je note tout pas d'oubli",
            toRight: .pratique,
            toLeft: .theorique
        ),
        
        Question(questionTitle: "En termes de créativité ...",
            imgRight: UIImage(named: "monkey")!,
            imgLeft: UIImage(named: "beer")!,
            textRight: "Créa-quoi ? J'ai pas d'inspi déso",
            textLeft: "Inspiré.e & encore plus en soirée",
            toRight: .pratique,
            toLeft: .theorique
        ),

        Question(questionTitle: "Pour toi travailler en groupe c'est ...",
            imgRight: UIImage(named: "sad")!,
            imgLeft: UIImage(named: "interested")!,
            textRight: "Relou, flemme de me sociabiliser",
            textLeft: "L'occasion d'échapper ( et pourquoi pas choper un numéro)",
            toRight: .pratique,
            toLeft: .theorique
        ),
        
        Question(questionTitle: "Après les cours tu fais quoi ?",
            imgRight: UIImage(named: "compo2")!,
            imgLeft: UIImage(named: "compo1")!,
            textRight: "J'ai toujours une sortie ou une expo de prévue",
            textLeft: "Je rentre, je me fais mon meilleur gouter et j'allume les écrans DIRECT",
            toRight: .pratique,
            toLeft: .theorique
        ),

        Question(questionTitle: "Pour toi l'esthétisme c'est ...",
            imgRight: UIImage(named: "gear")!,
            imgLeft: UIImage(named: "stars")!,
            textRight: "Superflu, ce qui compte c'est ce que ce soit fonctionnel",
            textLeft: "Primordial à tout les niveaux (une image pixelisée ? NO WAY)",
            toRight: .pratique,
            toLeft: .theorique
        ),
        
        Question(questionTitle: "Pour toi un travail est terminé quand ...",
            imgRight: UIImage(named: "validate")!,
            imgLeft: UIImage(named: "sparks")!,
            textRight: "J'ai finis des respecter les consignes",
            textLeft: "TOUT est absolument parfait",
            toRight: .pratique,
            toLeft: .theorique
        ),
        
        Question(questionTitle: "Quand tu bosse t'es ...",
            imgRight: UIImage(named: "mobile")!,
            imgLeft: UIImage(named: "shhhh")!,
            textRight: "Oh un oiseau ! Oh j'ai une notification de mon crush !",
            textLeft: "Chut ! j'suis dans mon truc là",
            toRight: .pratique,
            toLeft: .theorique
        ),
        
        Question(questionTitle: "Toi t'es plutôt le pote ...",
            imgRight: UIImage(named: "cross")!,
            imgLeft: UIImage(named: "blabla")!,
            textRight: "J'ai jamais mon tel allumé donc si t'as un pb, appelle quelqu'un d'autre",
            textLeft: "Psy, je veux savoir ce qu'il se passe dans la tête des gens",
            toRight: .pratique,
            toLeft: .theorique
        ),

        Question(questionTitle: "Ta relation avec ton téléphone ...",
            imgRight: UIImage(named: "smile")!,
            imgLeft: UIImage(named: "link")!,
            textRight: "J'ai de la batterie un jour sur deux, quelqu'un à un chargeur ?",
            textLeft: "Inséparables je ne vois pas ma vie sans lui",
            toRight: .pratique,
            toLeft: .theorique
        ),
        
        Question(questionTitle: "Pour toi, être dirigé c'est ...",
            imgRight: UIImage(named: "doe")!,
            imgLeft: UIImage(named: "tree")!,
            textRight: "Moi ? Personne peut me diriger c'est moi le boss",
            textLeft: "Moins de responsabilités pour plus de tranquilité",
            toRight: .pratique,
            toLeft: .theorique
        ),
    ]

    
    var responses =  [Response]()
    
    enum State{
        case ongoing, over
    }
    
    var state: State = .ongoing
    
    var currentQuestion: Question{
        return questions[currentIndex]
    }
    
    private func finish(){
        state = .over
        
        print(responses)
        
        print("finished")
    }
    
    private func goToNextQuestion(){
        
        currentIndex < questions.count - 1 ?currentIndex += 1 : finish()
    }
    
    
    func setResponse(_ response:Response){
        // je dois faire le system de point ici
        responses.append(response)
        
        goToNextQuestion()
    }
}

enum Response {
    
    case left, right
    
}
