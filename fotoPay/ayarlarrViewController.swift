//
//  ayarlarrViewController.swift
//  fotoPay
//
//  Created by tuğba berk on 2.02.2025.
//

import UIKit
import FirebaseAuth

class ayarlarrViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func çıkışyap(_ sender: Any) {
        do{
            try Auth.auth().signOut()
            performSegue(withIdentifier:"ayarlarsegue", sender: nil)
            
            
        }catch{
            print("hata")
        }
    }

}
