//
//  YapilacaklarDetayInteractor.swift
//  BootcampHw7
//
//  Created by Utku Mutlu on 12.10.2022.
//

import Foundation

class YapilacaklarDetayInteractor:PresenterToInteractorYapilacaklarDetayProtocol{
    let dB:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        dB = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func yapilacaklarGuncelle(yapilacak_id: Int, yapilacak_is: String) {
        dB?.open()
        do{
        
            try dB!.executeUpdate("UPDATE yapilacaklar SET yapilacak_is = ? WHERE yapilacak_id = ?" , values: [yapilacak_is])
        }catch{
            print(error.localizedDescription)
        }
        
        dB?.close()    }
    
}
