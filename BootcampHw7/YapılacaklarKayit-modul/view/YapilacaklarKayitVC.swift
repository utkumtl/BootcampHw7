//
//  YapilacaklarKayitVC.swift
//  BootcampHw7
//
//  Created by Utku Mutlu on 12.10.2022.
//

import UIKit

class YapilacaklarKayitVC: UIViewController {

    @IBOutlet weak var tfYapılacakIs: UITextField!
    
    var yapilacaklarKayitPresenterNesnesi : ViewToPresenterYapilacaklarKayitProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        YapilacaklarKayitRouter.createModule(ref: self)

        // Do any additional setup after loading the view.
    }
    
    @IBAction func buttonEkle(_ sender: Any) {
        if let yi = tfYapılacakIs.text{
            yapilacaklarKayitPresenterNesnesi?.Ekle(yapilacak_is: yi)
        }
    }
    
    

}
