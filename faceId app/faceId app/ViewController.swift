//
//  ViewController.swift
//  faceId app
//
//  Created by Emre on 6.02.2025.
//

import UIKit
import LocalAuthentication

class ViewController: UIViewController {
    @IBOutlet weak var label: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func signInClicked(_ sender: Any) {
        
        let authContext = LAContext()
        
        var error : NSError?
        
        if authContext.canEvaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, error: &error) {
            
            authContext.evaluatePolicy(.deviceOwnerAuthenticationWithBiometrics, localizedReason: "is it you?") { success, error in
                if success == true {
                    // success auth
                    DispatchQueue.main.async {
                        self.performSegue(withIdentifier: "toSecondVC", sender: nil)
                    }
                }else {
                    DispatchQueue.main.async {
                        self.label.text = "error"
                    }
                    
                }
            }
            
        }
        
    }
    
}

