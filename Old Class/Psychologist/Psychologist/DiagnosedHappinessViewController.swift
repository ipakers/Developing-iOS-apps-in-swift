//
//  DiagnosedHappinessViewController.swift
//  Psychologist
//
//  Created by Isaac Perry on 4/14/16.
//  Copyright © 2016 Isaac Perry. All rights reserved.
//

import UIKit

class DiagnosedHappinessViewController: HappinessViewController, UIPopoverPresentationControllerDelegate {
    
    private let defaults = NSUserDefaults.standardUserDefaults()
    
    var diagnosticHistory: [Int] {
        get {
            return defaults.objectForKey(History.DefaultsKey) as? [Int] ?? []
        }
        
        set {
            defaults.setObject(newValue, forKey: History.DefaultsKey)
        }
    }
    
    override var happiness: Int {
        didSet {
            diagnosticHistory += [happiness]
        }
    }
    
    private struct History {
        static let SegueIdentifier = "Show Diagnostic History"
        static let DefaultsKey = "DiagnosedHappinessViewController.History"
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let identifier = segue.identifier {
            switch identifier {
            case History.SegueIdentifier:
                if let textViewController = segue.destinationViewController as? TextViewController {
                    if let popoverPresentationController = textViewController.popoverPresentationController {
                        popoverPresentationController.delegate = self
                    }
                    textViewController.text = "\(diagnosticHistory)"
                }
            default:
                break
            }
        }
    }
    
    func adaptivePresentationStyleForPresentationController(controller: UIPresentationController) -> UIModalPresentationStyle {
        return UIModalPresentationStyle.None
    }
}
