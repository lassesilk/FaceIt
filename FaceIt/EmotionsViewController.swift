//
//  EmotionsViewController.swift
//  FaceIt
//
//  Created by Lasse Silkoset on 13.12.2017.
//  Copyright © 2017 Lasse Silkoset. All rights reserved.
//

import UIKit

class EmotionsViewController: VCLLoggingViewController {


    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        var destinationViewController = segue.destination
        //Cast so destinationViewController is the navigationController
        //This if is so if we change our mind later on, the code will stil work, even if we
        //remove the Navigation Controller.
        if let navigationController = destinationViewController as? UINavigationController {
            destinationViewController = navigationController.visibleViewController ?? destinationViewController
        }
        if let faceViewController = destinationViewController as? FaceViewController,
            //Make a notice of the comma behind the sentence, this means that all of theese three first lines has "if let"
        let identifier = segue.identifier,
            let expression = emotionalFaces[identifier] {
        faceViewController.expression = expression
            //Can not send to senders current title, unless we cast. Because sender is any. as? returns optional, so we chain.
        faceViewController.navigationItem.title = (sender as? UIButton)?.currentTitle
    }
}
    //Making this dictionary so the application is easily extensable.
private let emotionalFaces: Dictionary<String, FacialExpression> = [
    "sad" : FacialExpression(eyes: .closed, mouth: .frown),
    "happy" : FacialExpression(eyes: .open, mouth: .smile),
    "worried" : FacialExpression(eyes: .open, mouth: .smirk)
]

    }
