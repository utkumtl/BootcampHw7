//
//  YapilacaklarKayitPresenter.swift
//  BootcampHw7
//
//  Created by Utku Mutlu on 12.10.2022.
//

import Foundation

class YapilacaklarKayitPresenter : ViewToPresenterYapilacaklarKayitProtocol{
    var yapilacaklarKayitInteractor : PresenterToInteractorYapilacaklarKayitProtocol?
    
    func Ekle(yapilacak_is: String) {
        yapilacaklarKayitInteractor?.yapilacakEkle(yapilacak_is: yapilacak_is)
    }

}
