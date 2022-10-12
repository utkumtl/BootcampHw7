//
//  ViewController.swift
//  BootcampHw7
//
//  Created by Utku Mutlu on 12.10.2022.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var yapilacaklarTableView: UITableView!
    
    var yapilacaklarListe = [Yapilacaklar]()
    
    var anasayfaPresenterNesnesi : ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        searchBar.delegate = self
        
        yapilacaklarTableView.delegate = self
        yapilacaklarTableView.dataSource = self
        
        veritabaniKopyala()
        
        AnasayfaRouter.createModule(ref: self)
    }
    // Anasayfaya dönüldüğünde verileri alır
    override func viewWillAppear(_ animated: Bool) {
        anasayfaPresenterNesnesi?.YapilacaklariAl()
    }

   
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay"{
            if let yapilacak = sender as? Yapilacaklar{
                let gidilecekVC = segue.destination as! YapilacaklarDetayVC
                gidilecekVC.yapilacak = yapilacak
            }
        }
    }
    
    
    func veritabaniKopyala(){
        let bundleYolu = Bundle.main.path(forResource: "yapilacaklar", ofType: ".sqlite")
        let hedefYol = NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true).first!
        let kopyalanacakYer = URL(fileURLWithPath: hedefYol).appendingPathComponent("yapilacaklar.sqlite")
        let fileManager = FileManager.default
        
        if fileManager.fileExists(atPath: kopyalanacakYer.path){
            print("Veritabanı daha önce kopyalanmış.")
        }
        else{
            do{
                try fileManager.copyItem(atPath: bundleYolu!, toPath: kopyalanacakYer.path)
            }
            catch{
                print(error)
            }
        }
    }
    
    
    
}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol{
    func vieweVeriGonder(yapilacaklarListesi: [Yapilacaklar]) {
        self.yapilacaklarListe = yapilacaklarListesi
        self.yapilacaklarTableView.reloadData()
    }
}


// SearchBar modülü
extension AnasayfaVC : UISearchBarDelegate{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        anasayfaPresenterNesnesi?.Ara(aramaKelimesi: searchText)
        
    }
}



//TableView modülü
extension AnasayfaVC : UITableViewDelegate, UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yapilacaklarListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let yapilacak = yapilacaklarListe[indexPath.row]
        let hucre = tableView.dequeueReusableCell(withIdentifier: "yapilacaklarHucre") as! TableViewHucre
        
        hucre.yapilacakIsBilgiLabel.text = "\(yapilacak.yapilacak_is!)"
        return hucre
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yapilacak = yapilacaklarListe[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: yapilacak)
        tableView.deselectRow(at: indexPath , animated: true)
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            let yapilacak = self.yapilacaklarListe[indexPath.row]
            
            let alert = UIAlertController(title: "Silme İşlemi", message: "\(yapilacak.yapilacak_is!) işini silmek istiyor musunuz? ", preferredStyle: .alert)
            let iptalAction = UIAlertAction(title: "İPTAL", style: .cancel)
            alert.addAction(iptalAction)
            let evetAction = UIAlertAction(title: "EVET", style: .destructive){
                action in
                self.anasayfaPresenterNesnesi?.Sil(yapilacak_id: yapilacak.yapilacak_id!)
                
            }
            alert.addAction(evetAction)
            
            self.present(alert, animated: true)
        }
        return UISwipeActionsConfiguration(actions: [silAction])
    }
}
