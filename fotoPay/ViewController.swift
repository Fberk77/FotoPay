//
//  ViewController.swift
//  fotoPay
//
//  Created by tuğba berk on 25.12.2024.
//

import UIKit
import FirebaseAuth


class ViewController: UIViewController {

    @IBOutlet weak var email: UITextField!
    @IBOutlet weak var sifre: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func girisYap(_ sender: Any) {
       
        if email.text != "" && sifre.text != "" { // Email ve şifre boş değilse giriş yap
            Auth.auth().signIn(withEmail: email.text!, password: sifre.text!) { result, error in
                // Firebase Authentication kullanarak giriş olma işlemi başlatılır

                if let error = error { // Hata varsa if içine gir
                    self.hataMesajı(titleInput: "Hata!", messageInput: error.localizedDescription)
                } else { // Hata yoksa else bloğuna gir
                    self.performSegue(withIdentifier: "tabbarGirs", sender: nil)
                }
            }
        } else {
            hataMesajı(titleInput: "Hata!", messageInput: "Email veya parola giriniz.")
        }

     
    }
    
    @IBAction func kayıtOl(_ sender: Any) {
        
        // Kullanıcıdan alınan e-posta ve şifre boş değilse işlemi başlat
        if email.text != "" && sifre.text != "" {
            // Firebase Authentication kullanarak kayıt olma işlemi başlatılır.
            Auth.auth().createUser(withEmail: email.text!, password: sifre.text!) { kayıtolHata, error in
                
                // Eğer bir hata oluşursa
                if error != nil {
                    // Kullanıcıya hata mesajı gösterilir.
                    self.hataMesajı(titleInput: "Hata !", messageInput: error?.localizedDescription ?? "Hata Aldınız, Tekrar Deneyin")
                } else {
                    // Kayıt başarılıysa, ilgili sayfaya geçiş yapılır.
                    self.performSegue(withIdentifier: "tabbarGirs", sender: nil)
                }
            }
        } else {
            // E-posta veya şifre boş ise kullanıcıya hata mesajı gösterilir.
            hataMesajı(titleInput: "Kayıt Ol", messageInput: "Email ve parola giriniz ")
        }
    }
    
    // Hata mesajı göstermek için tanımlanan yardımcı fonksiyon
    func hataMesajı(titleInput: String , messageInput: String){
        // UIAlertController ile uyarı mesajı hazırlanır.
        let alert = UIAlertController(title: titleInput, message: messageInput, preferredStyle: UIAlertController.Style.alert)
        
        // Uyarı kutusuna bir "Ok" butonu eklenir.
        let hataButon = UIAlertAction(title: "Ok", style: UIAlertAction.Style.default, handler: nil)
        
        // "Ok" butonu uyarı kutusuna eklenir.
        alert.addAction(hataButon)
        
        // Uyarı kutusu ekranda gösterilir.
        self.present(alert, animated: true, completion: nil)
    }
        
        
        
        
    
    
    
    

    
}

