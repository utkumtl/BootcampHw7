//
//  AnasayfaProtocols.swift
//  BootcampHw7
//
//  Created by Utku Mutlu on 12.10.2022.
//

import Foundation

protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor:PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView:PresenterToViewAnasayfaProtocol? {get set}
    
    func YapilacaklariAl()
    func Ara(aramaKelimesi:String)
    func Sil(yapilacak_id:Int)
}

protocol PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter:InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumYapilacaklariAl()
    func yapilacaklariAra(aramaKelimesi:String)
    func yapilacaklarıSil(yapilacak_id:Int)
}

protocol InteractorToPresenterAnasayfaProtocol {
    func presenteraVeriGonder(yapilacaklarListesi:[Yapilacaklar])

}

protocol PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yapilacaklarListesi:[Yapilacaklar])
}

protocol PresenterToRouterAnasayfaProtocol {
    static func createModule(ref: AnasayfaVC)
}
