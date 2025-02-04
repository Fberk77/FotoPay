//
//  UpdateViewController.swift
//  fotoPay
//
//  Created by tuğba berk on 31.01.2025.
//

import UIKit

class UpdateViewController: UIViewController ,UIImagePickerControllerDelegate,UINavigationControllerDelegate {

    @IBOutlet weak var resimSec: UIImageView!
    
    @IBOutlet weak var yorum: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        resimSec.isUserInteractionEnabled = true // resimi tıklana bilir hale getiridik
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(gorselSec)) // burada resme dokunduğunu anlamızı sağlar ve yeni görseli seçmemiz için görsel seç foksiyonunu kullanırızz
        resimSec.addGestureRecognizer(gestureRecognizer)
    }
    
    @objc func gorselSec() {
        
        let pickerController = UIImagePickerController() // kulanıcının galeriden veya kameradan fotoğraf eklemsini sağlar
        pickerController.delegate = self
        pickerController.sourceType = .photoLibrary // kulanıcının resimleri galeriden seçecemesini sağlar
        present(pickerController, animated: true, completion: nil) // görsel seçme ekranını açar ve bunun animosyonlu açılmasını sağlar
    }
    
    // didFinishPickingMediaWithInfo
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        
        resimSec.image = info[.originalImage] as? UIImage // seçilen görüntü bir UIImage nesnesine dönüştürülür seçilen örüntü resimSec aktarılır
        self.dismiss(animated: true, completion: nil) // resiim seçildikten sonra resimi seçtiğimiz ekranın kapatılmasını sağllar
    }
   
    @IBAction func ekle(_ sender: Any) {
    }
    
}
