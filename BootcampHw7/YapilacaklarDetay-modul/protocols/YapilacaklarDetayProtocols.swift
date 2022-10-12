//
//  YapilacaklarDetayProtocols.swift
//  BootcampHw7
//
//  Created by Utku Mutlu on 12.10.2022.
//

import Foundation

protocol ViewToPresenterYapilacaklarDetayProtocol {
    var yapilacaklarDetayInteractor: PresenterToInteractorYapilacaklarDetayProtocol? {get set}
    
    func Guncelle(yapilacak_id:Int,yapilacak_is:String)

}

protocol PresenterToInteractorYapilacaklarDetayProtocol {
    func yapilacaklarGuncelle(yapilacak_id:Int,yapilacak_is:String)

}

protocol PresenterToRouterYapilacaklarDetayProtocol {
    static func createModule(ref: YapilacaklarDetayVC)
    
    
}
