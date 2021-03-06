//
//  VerSnapViewController.swift
//  Snapchat
//
//  Created by Erick Roy Fernandez Terrel on 6/12/19.
//  Copyright © 2019 Erick Roy Fernandez Terrel. All rights reserved.
//

import UIKit
import SDWebImage
import Firebase
class VerSnapViewController: UIViewController {

    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var label: UILabel!
    
    var snap = Snap()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        label.text? = snap.descrip
        imageView.sd_setImage(with: URL(string: snap.imageURL))
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        FIRDatabase.database().reference().child("usuarios").child(FIRAuth.auth()!.currentUser!.uid).child("snaps").child(snap.id).removeValue()
        
        FIRStorage.storage().reference().child("imagenes").child("\(snap.imagenID).jpg").delete{(error) in
            print("se elimino la imagen correctamente")
        }
    }
}
