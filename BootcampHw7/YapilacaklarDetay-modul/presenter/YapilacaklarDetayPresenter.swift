//
//  YapilacaklarDetayPresenter.swift
//  BootcampHw7
//
//  Created by Utku Mutlu on 12.10.2022.
//

import Foundation

class YapilacaklarDetayPresenter:ViewToPresenterYapilacaklarDetayProtocol{
    var yapilacaklarDetayInteractor: PresenterToInteractorYapilacaklarDetayProtocol?
    
    func Guncelle(yapilacak_id: Int, yapilacak_is: String) {
        yapilacaklarDetayInteractor?.yapilacaklarGuncelle(yapilacak_id: yapilacak_id, yapilacak_is: yapilacak_is)
    }

    
}
