//
//  ColorCell.swift
//  HorizontalScrollView
//
//  Created by Elliot Glaze on 12/09/2019.
//  Copyright © 2019 Elliot Glaze. All rights reserved.
//

import UIKit

class ColorCell: UICollectionViewCell, UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout {
    
    private let cellId = "multipleCellId"
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        setupViews()
        
        
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    let innerCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let cv = UICollectionView(frame: .zero, collectionViewLayout: layout)
        cv.backgroundColor = .blue
        cv.translatesAutoresizingMaskIntoConstraints = false
        return cv
    }()
    
    func setupViews() {
        backgroundColor = .red
        
        addSubview(innerCollectionView)
        
        innerCollectionView.dataSource = self
        innerCollectionView.delegate = self
        innerCollectionView.register(MultipleCell.self, forCellWithReuseIdentifier: cellId)
        
        innerCollectionView.topAnchor.constraint(equalTo: topAnchor).isActive = true
        innerCollectionView.bottomAnchor.constraint(equalTo: bottomAnchor).isActive = true
        innerCollectionView.widthAnchor.constraint(equalTo: widthAnchor).isActive = true
    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: cellId, for: indexPath) as! MultipleCell
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 150, height: frame.height)
    }
    
}
