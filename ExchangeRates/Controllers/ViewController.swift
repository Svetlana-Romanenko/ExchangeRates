//
//  ViewController.swift
//  ExchangeRates
//
//  Created by Светлана Романенко on 04.12.2021.
//

import UIKit

class ViewController: UIViewController {
    public var exchangeRatesViewModel: ExchangeRatesViewModel?
    private var dataSource: ExchangeRatesModel?
    private var collectionView: UICollectionView?

    override func viewDidLoad() {
        super.viewDidLoad()
        exchangeRatesViewModel = ExchangeRatesViewModel()
        
        collectionView = UICollectionView(frame: self.view.frame,collectionViewLayout: UICollectionViewFlowLayout())
        let cellWidth : CGFloat = collectionView?.frame.size.width ?? 60 / 2.0
        let cellheight : CGFloat = collectionView?.frame.size.height ?? 60 - 2.0
        let cellSize = CGSize(width: cellWidth , height:cellheight)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.itemSize = cellSize
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        
        collectionView?.setCollectionViewLayout(layout, animated: true)
        collectionView?.register(CustomCell.self, forCellWithReuseIdentifier: CustomCell.identifier)
        collectionView?.backgroundColor = UIColor.white
        collectionView?.dataSource = self
        collectionView?.delegate = self
        view.addSubview(collectionView ?? UICollectionView())
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        exchangeRatesViewModel?.getAPIData(param: [:], completion: { model, error in
            if let _ = error {
                DispatchQueue.main.async {
                    let alert = UIAlertController(title: "Error", message: error?.message, preferredStyle: UIAlertController.Style.alert)
                    self.present(alert, animated: true, completion: nil)
                }
            } else {
                if let model = model {
                    self.dataSource = model
                    
                    DispatchQueue.main.async {
                        self.collectionView?.reloadData()
                    }
                }
            }
        })
    }
}

extension ViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return dataSource?.rates?.count ?? 0
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: CustomCell.identifier, for: indexPath) as? CustomCell
        let result = self.dataSource?.rates?[indexPath.row]
        myCell?.configure(title: result?.name ?? "")
        return myCell ?? UICollectionViewCell()
    }
}

extension ViewController: UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       print("User tapped on item \(indexPath.row)")
    }
}

extension ViewController: UICollectionViewDelegateFlowLayout
{
    public func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        
        let cellWidth : CGFloat = self.view.frame.size.width/2 - 15
        let cellheight : CGFloat = self.view.frame.size.width/2 - 15

        return CGSize(width: cellWidth , height:  cellheight)
    }
}
