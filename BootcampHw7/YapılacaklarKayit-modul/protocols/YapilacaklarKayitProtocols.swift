//
//  YapilacaklarKayitProtocols.swift
//  BootcampHw7
//
//  Created by Utku Mutlu on 12.10.2022.
//

import Foundation

protocol ViewToPresenterYapilacaklarKayitProtocol {
    var yapilacaklarKayitInteractor : PresenterToInteractorYapilacaklarKayitProtocol? {get set}
    
    func Ekle(yapilacak_is:String)

}

protocol PresenterToInteractorYapilacaklarKayitProtocol {
    func yapilacakEkle(yapilacak_is:String)
    
}




protocol PresenterToRouterYapilacaklarKayitProtocol {
    static func createModule(ref:YapilacaklarKayitVC)
}
