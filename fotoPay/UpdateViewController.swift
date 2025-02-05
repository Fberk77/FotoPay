//
//  UpdateViewController.swift
//  fotoPay
//
//  Created by tuğba berk on 31.01.2025.
//

import UIKit
import FirebaseStorage
import FirebaseFirestoreInternal
import FirebaseAuth


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
        
        let storage = Storage.storage()
        let storageReference = storage.reference()
        
        let mediaFolder = storageReference.child("media") // referansın buluduğu yere media klosörünü oluşturduk
        if let data = resimSec.image?.jpegData(compressionQuality: 0.5) {
            let uuid = UUID().uuidString
            let imageReference = mediaFolder.child("\(uuid).jpg") // media klosörünün altına jpg klosörü oluşturduk
             imageReference.putData(data, metadata: nil) { StorageMetadata, error in
                 if error != nil {
                     self.hataMesajı(titleInput: "Hata!", messageInput: error?.localizedDescription ?? "hata Aldınız Tekrar Deneyiniz!")                 }else{
                     /// burda eğer hata mesajı yoksa resmin uresilini sitringe çevir ve ekrana yazdır
                     imageReference.downloadURL { url, error in
                         if error == nil {
                             let imageUrl = url?.absoluteString
                             
                             if let imageUrl = imageUrl {
                                 let firestoreDatabase = Firestore.firestore()
                                 
                                 let firestorePost = ["gorselUrl" : imageUrl , "yorum" : self.yorum.text! , "email" : Auth.auth().currentUser!.email , "tarih" : FieldValue.serverTimestamp()] as [String : Any]
                                 
                                 firestoreDatabase.collection("post").addDocument(data: firestorePost ) { (Error) in
                                     if Error != nil {
                                         
                                         self.hataMesajı(titleInput: "Hata!", messageInput: Error?.localizedDescription ?? "Hata Var Tekrar Deneyiniz !")
                                         
                                         
                                     }else {
                                         
                                         
                                     }
                                 }
                             }
                            
                         }
                     }
                 }
            }
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
