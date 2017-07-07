//
//  ViewController.swift
//  Psychologist
//
//  Created by Isaac Perry on 4/13/16.
//  Copyright © 2016 Isaac Perry. All rights reserved.
//

import UIKit

class PsychologistViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        var destination = segue.destinationViewController as? UIViewController
        if let navigationController = destination as? UINavigationController {
            destination = navigationController.visibleViewController
        }
        
        if let happinessViewController = destination as? HappinessViewController {
            if let identifier = segue.identifier {
                switch identifier {
                case "sad":
                    happinessViewController.happiness = 0
                case "happy":
                    happinessViewController.happiness = 100
                default:
                    happinessViewController.happiness = 50
                }
            }
        }
    }

}

