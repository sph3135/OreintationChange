//
//  ViewController.swift
//  landscape
//
//  Created by SRS-WEB on 05/06/23.
//

import UIKit

class ViewController: UIViewController {
    
    //Method 1
    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
        if !UIDevice.current.orientation.isLandscape{
            portraitModeFunction()
        } else {
            landscapeModeFunction()
        }
    }

    @IBOutlet weak var labelTest: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        self.labelTest.text = "testLabel"
        
        //Method 2
        NotificationCenter.default.addObserver(self, selector: #selector(orientationDidChange), name: UIDevice.orientationDidChangeNotification, object: nil)
    }
    @objc func orientationDidChange() {
        let device = UIDevice.current
        switch device.orientation {
        case .landscapeLeft, .landscapeRight:
            // Call the function for landscape mode
            landscapeModeFunction()
        case .portrait, .portraitUpsideDown:
            // Call the function for portrait mode
            portraitModeFunction()
        default:
            break
        }
    }
    
    func landscapeModeFunction() {
        self.labelTest.text = "Landscape mode"

    }
    
    func portraitModeFunction() {
        self.labelTest.text = "Portrait mode"
    }
    
    deinit {
        // Remove the observer when the view controller is deallocated
        NotificationCenter.default.removeObserver(self, name: UIDevice.orientationDidChangeNotification, object: nil)
    }

}
