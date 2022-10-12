//
//  AnasayfaPresenter.swift
//  BootcampHw7
//
//  Created by Utku Mutlu on 12.10.2022.
//

import Foundation

class AnasayfaPresenter : ViewToPresenterAnasayfaProtocol{
    var anasayfaInteractor: PresenterToInteractorAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func YapilacaklariAl() {
        anasayfaInteractor?.tumYapilacaklariAl()
    }
    func Ara(aramaKelimesi: String) {
        anasayfaInteractor?.yapilacaklariAra(aramaKelimesi: aramaKelimesi)
    }
    
    func Sil(yapilacak_id: Int) {
        anasayfaInteractor?.yapilacaklarıSil(yapilacak_id: yapilacak_id)
    }
}


extension AnasayfaPresenter : InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yapilacaklarListesi: [Yapilacaklar]) {
        anasayfaView?.vieweVeriGonder(yapilacaklarListesi: yapilacaklarListesi)
    }
}
