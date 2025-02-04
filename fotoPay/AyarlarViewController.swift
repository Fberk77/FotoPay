//
//  AyarlarViewController.swift
//  fotoPay
//
//  Created by tuğba berk on 31.01.2025.
//

import UIKit
import FirebaseAuth

class AyarlarViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    @IBAction func çikisyap(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier:"AyarlarSegue", sender: nil)
            
            
        }catch{
            print("hata")
        }
        
    }
    

    @IBAction func cıkısYap(_ sender: Any) {
        
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier:"AyarlarSegue", sender: nil)
            
            
        }catch{
            print("hata")
        }
    }

}
