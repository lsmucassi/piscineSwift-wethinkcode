//
//  ViewController.swift
//  ex00
//
//  Created by Linda MUCASSI on 2018/10/05.
//  Copyright © 2018 Linda MUCASSI. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var myCollectionView: UICollectionView!
    let array:[String] = [
            "https://images.pexels.com/photos/248797/pexels-photo-248797.jpeg",
            "https://images.pexels.com/photos/34950/pexels-photo.jpg",
            "https://images.pexels.com/photos/1039302/pexels-photo-1039302.jpeg",
            "https://images.pexels.com/photos/799443/pexels-photo-799443.jpeg",
            "https://images.pexels.com/photos/325185/pexels-photo-325185.jpeg"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        let itemSize = UIScreen.main.bounds.width/2 - 3
        let itemLayout = UICollectionViewFlowLayout()
        itemLayout.sectionInset = UIEdgeInsetsMake(20, 0,10,0)
        itemLayout.itemSize = CGSize(width: itemSize, height: itemSize)
        
        itemLayout.minimumInteritemSpacing = 3
        itemLayout.minimumLineSpacing = 3
        
        myCollectionView.collectionViewLayout = itemLayout
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    //number of views
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return array.count
    }
   
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let url = URL(string: array[indexPath.row])
        let data = try? Data(contentsOf: url!)
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! imageCell
        cell.imgView.image = UIImage(data: data!)
        return cell
    }
}

