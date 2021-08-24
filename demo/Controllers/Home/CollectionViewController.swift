//
//  CollectionViewController.swift
//  demo
//
//  Created by Jason on 2020/11/30.
//  Copyright © 2020 youzy. All rights reserved.
//

import UIKit

let bgcolor = #colorLiteral(red: 0.2549019754, green: 0.2745098174, blue: 0.3019607961, alpha: 1)

let kScreenHeight = UIScreen.main.bounds.size.height

let kScreenWidth = UIScreen.main.bounds.size.width

private let reuseIdentifier = "CollectionViewCell"

class CollectionViewController: UICollectionViewController {

    var selectedCell: CollectionViewCell?
    var selectedCellImageViewSnapshot: UIView?
    
    var selectedCellFrame: CGRect = .zero
    var afterRect: CGRect = .zero

    var dataSource: [CellData] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        collectionView.register(UINib.init(nibName: "CollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "CollectionViewCell")

        dataSource = [
            .init(image: #imageLiteral(resourceName: "7"), title: "Seychelles"),
            .init(image: #imageLiteral(resourceName: "1"), title: "Königssee"),
            .init(image: #imageLiteral(resourceName: "3"), title: "Zanzibar"),
            .init(image: #imageLiteral(resourceName: "7"), title: "Serengeti"),
            .init(image: #imageLiteral(resourceName: "4"), title: "Castle"),
            .init(image: #imageLiteral(resourceName: "2"), title: "Kyiv"),
            .init(image: #imageLiteral(resourceName: "turtlerock"), title: "Munich"),
            .init(image: #imageLiteral(resourceName: "1"), title: "Lake")
        ]
        
        collectionView.reloadData()
        collectionView.backgroundColor = bgcolor
        // Do any additional setup after loading the view.
    }


    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of items
        return dataSource.count
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! CollectionViewCell
        cell.configure(dataSource[indexPath.item])
    
        return cell
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let height = kScreenWidth / 2 * 3

        afterRect = CGRect(x: 0, y: 0, width: kScreenWidth, height: height)

        selectedCell = collectionView.cellForItem(at: indexPath) as? CollectionViewCell
        selectedCellImageViewSnapshot = selectedCell?.snapshotView(afterScreenUpdates: false)
        if let cell = selectedCell {
            selectedCellFrame = cell.convert(cell.bounds, to: self.view)
        }
        let firstView = self.navigationController?.view.snapshotView(afterScreenUpdates: true)
        let vc = SecondViewController.init(selectedCellSnapshot: selectedCellImageViewSnapshot!, cellSelectedRect: selectedCellFrame, cellAfterRect: afterRect, selectedImage: (selectedCell?.imageView)!, firstView: firstView!)
        vc.data = dataSource[indexPath.row]
        self.present(vc, animated: true, completion: nil)

    }
    
}
