//
//  ViewController.swift
//  Cassini
//
//  Created by Isaac Perry on 4/18/16.
//  Copyright © 2016 Isaac Perry. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if let imageViewController = segue.destinationViewController as? ImageViewController {
            if let identifier = segue.identifier {
                switch identifier {
                    case "Earth":
                        imageViewController.imageURL = DemoURL.NASA.Earth
                        imageViewController.title = "Earth"
                    case "Saturn":
                        imageViewController.imageURL = DemoURL.NASA.Saturn
                        imageViewController.title = "Saturn"
                    case "Cassini":
                        imageViewController.imageURL = DemoURL.NASA.Cassini
                        imageViewController.title = "Cassini"
                    default:
                        break
                }
            }
        }
    }


}

