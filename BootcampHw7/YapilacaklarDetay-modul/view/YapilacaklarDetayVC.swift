//
//  YapilacaklarDetayVC.swift
//  BootcampHw7
//
//  Created by Utku Mutlu on 12.10.2022.
//

import UIKit

class YapilacaklarDetayVC: UIViewController {

    @IBOutlet weak var tfYapılacakIs: UITextField!
    
    var yapilacak:Yapilacaklar?
    
    var yapilacaklarDetayPresenterNesnesi : ViewToPresenterYapilacaklarDetayProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let y = yapilacak{
            tfYapılacakIs.text = y.yapilacak_is
        }

        YapilacaklarDetayRouter.createModule(ref: self)
    }
    

    @IBAction func buttonGuncelle(_ sender: Any) {
        if let yi = tfYapılacakIs.text , let y = yapilacak{
            yapilacaklarDetayPresenterNesnesi?.Guncelle(yapilacak_id: y.yapilacak_id!, yapilacak_is: yi)
        }
    }
    
    
}
