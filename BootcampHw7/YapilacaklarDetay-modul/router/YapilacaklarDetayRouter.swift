//
//  YapilacaklarDetayRouter.swift
//  BootcampHw7
//
//  Created by Utku Mutlu on 12.10.2022.
//

import Foundation

class YapilacaklarDetayRouter: PresenterToRouterYapilacaklarDetayProtocol{
    static func createModule(ref: YapilacaklarDetayVC){
        ref.yapilacaklarDetayPresenterNesnesi = YapilacaklarDetayPresenter()
        ref.yapilacaklarDetayPresenterNesnesi?.yapilacaklarDetayInteractor = YapilacaklarDetayInteractor()
    }
    
}
