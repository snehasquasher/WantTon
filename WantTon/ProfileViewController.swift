//
//  ProfileViewController.swift
//  WantTon
//
//  Created by Shreeya Indap on 7/15/21.
//

import UIKit
import FirebaseDatabase

private var collectionView: UICollectionView!
//private var posts: [Post] = []
private let cellPadding: CGFloat = 8
private let sectionPadding: CGFloat = 4

class ProfileViewController: UIViewController {
    
    let currentpfp = UIImageView(frame: CGRect(x: 0,y: 0,width: 100,height: 100))
    let nameLabel = UILabel()
    let cityLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .white
        
        currentpfp.layer.masksToBounds = false
        currentpfp.layer.cornerRadius = currentpfp.frame.height/2
        currentpfp.clipsToBounds = true
        currentpfp.translatesAutoresizingMaskIntoConstraints = false
        currentpfp.image = UIImage(named: "defaultpfp.jpeg")
        view.addSubview(currentpfp)
        
        nameLabel.translatesAutoresizingMaskIntoConstraints = false
        nameLabel.font = UIFont.boldSystemFont(ofSize: 18)
        nameLabel.text = "Tyler Creator"
        view.addSubview(nameLabel)
        
        cityLabel.translatesAutoresizingMaskIntoConstraints = false
        cityLabel.font = UIFont.systemFont(ofSize: 16)
        cityLabel.text = "New York City, NY"
        cityLabel.textColor = .darkGray
        view.addSubview(cityLabel)
        
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .vertical
        layout.minimumInteritemSpacing = cellPadding
        layout.minimumLineSpacing = cellPadding
        layout.sectionInset = UIEdgeInsets(top: sectionPadding, left: 0, bottom: sectionPadding, right: 0)

        collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        collectionView.backgroundColor = .clear
        view.addSubview(collectionView)
        
        setUpConstraints()
    }
    
    func setUpConstraints() {
        NSLayoutConstraint.activate([
            currentpfp.topAnchor.constraint(equalTo: view.topAnchor, constant: 100),
            currentpfp.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 50),
            currentpfp.widthAnchor.constraint(equalToConstant: 100),
            currentpfp.heightAnchor.constraint(equalToConstant: 100)
            ])
        
        NSLayoutConstraint.activate ([
            nameLabel.topAnchor.constraint(equalTo: currentpfp.topAnchor, constant: 22),
            nameLabel.leadingAnchor.constraint(equalTo: currentpfp.trailingAnchor, constant: 30)
        ])
        
        NSLayoutConstraint.activate ([
            cityLabel.topAnchor.constraint(equalTo: nameLabel.bottomAnchor, constant: 8),
            cityLabel.leadingAnchor.constraint(equalTo: nameLabel.leadingAnchor)
        ])
        
        let collectionViewPadding: CGFloat = 12
        NSLayoutConstraint.activate ([
            collectionView.topAnchor.constraint(equalTo: currentpfp.bottomAnchor, constant: 50),
            collectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: collectionViewPadding),
            collectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: collectionViewPadding),
            collectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -collectionViewPadding),
        ])
    }

}
