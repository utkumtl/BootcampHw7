//
//  AnasayfaInteractor.swift
//  BootcampHw7
//
//  Created by Utku Mutlu on 12.10.2022.
//

import Foundation

class AnasayfaInteractor:PresenterToInteractorAnasayfaProtocol{
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    
    
    let dB:FMDatabase?
    
    init(){
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        dB = FMDatabase(path: kopyalanacakYer.path)
    }
    
    func tumYapilacaklariAl() {
        var liste = [Yapilacaklar]()
        
        dB?.open()
        do{
            let r = try dB!.executeQuery("SELECT * FROM yapilacaklar", values: nil)
            
            while r.next(){
                let yapilacak = Yapilacaklar(
                                yapilacak_id: Int(r.string(forColumn: "yapilacak_id"))!,
                                   yapilacak_is: r.string(forColumn: "yapilacak_is")!)
                                   
                                liste.append(yapilacak)
            }
            
            anasayfaPresenter?.presenteraVeriGonder(yapilacaklarListesi: liste)

        }catch{
            print(error.localizedDescription)
        }
        
        dB?.close()
    }
    
    func yapilacaklariAra(aramaKelimesi: String) {
        var liste = [Yapilacaklar]()
        
        dB?.open()
        do{
            let r = try dB!.executeQuery("SELECT * FROM yapilacaklar WHERE yapilacak_is like '%\(aramaKelimesi)%'", values: nil)
            
            while r.next(){
                let yapilacak = Yapilacaklar(
                                yapilacak_id: Int(r.string(forColumn: "yapilacak_id"))!,
                                   yapilacak_is: r.string(forColumn: "yapilacak_is")!)
                liste.append(yapilacak)
            }
            
            anasayfaPresenter?.presenteraVeriGonder(yapilacaklarListesi: liste)

        }catch{
            print(error.localizedDescription)
        }
        
        dB?.close()
    }
    
    func yapilacaklarıSil(yapilacak_id: Int) {
        dB?.open()
        do{
        
            try dB!.executeUpdate("DELETE FROM yapilacaklar WHERE yapilacak_id = ?", values: [yapilacak_id])
            tumYapilacaklariAl()
        }catch{
            print(error.localizedDescription)
        }
        
        dB?.close()
    }
    
    
}
