//
//  YapilacaklarKayitRouter.swift
//  BootcampHw7
//
//  Created by Utku Mutlu on 12.10.2022.
//

import Foundation

class YapilacaklarKayitRouter: PresenterToRouterYapilacaklarKayitProtocol{
    static func createModule(ref: YapilacaklarKayitVC) {
        ref.yapilacaklarKayitPresenterNesnesi = YapilacaklarKayitPresenter()
        ref.yapilacaklarKayitPresenterNesnesi?.yapilacaklarKayitInteractor = YapilacaklarKayitInteractor()
    }
    
}
