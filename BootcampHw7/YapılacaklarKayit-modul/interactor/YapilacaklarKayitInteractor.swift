//
//  YapilacaklarKayitInteractor.swift
//  BootcampHw7
//
//  Created by Utku Mutlu on 12.10.2022.
//

import Foundation

class YapilacaklarKayitInteractor : PresenterToInteractorYapilacaklarKayitProtocol{
    let dB:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        dB = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func yapilacakEkle(yapilacak_is: String) {
        dB?.open()
        do{
        
            try dB!.executeUpdate("INSERT INTO yapilacaklar (yapilacak_is) VALUES (?)", values: [yapilacak_is])
        }catch{
            print(error.localizedDescription)
        }
        
        dB?.close()
    }

    
}
