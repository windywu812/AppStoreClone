//
//  ViewController.swift
//  AppStoreClone
//
//  Created by Windy on 24/08/20.
//  Copyright © 2020 Windy. All rights reserved.
//
// Dummy data from https://www.hackingwithswift.com

import UIKit

class ViewController: UIViewController {
    
    var dataSource: UICollectionViewDiffableDataSource<Section, App>?
    var collectionView: UICollectionView!
    var sections = Bundle.main.decode([Section].self, from: "appstore.json")
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.title = "Games"
        navigationController?.navigationBar.prefersLargeTitles = true
        
        configureCollectionView()
    }
    
    private func configureCollectionView() {
        collectionView = UICollectionView(frame: UIScreen.main.bounds, collectionViewLayout: createLayout())
        collectionView.backgroundColor = .systemBackground
        
        collectionView.register(FeaturedCell.self, forCellWithReuseIdentifier: FeaturedCell.reuseIdentifier)
        collectionView.register(MediumTableCell.self, forCellWithReuseIdentifier: MediumTableCell.reuseIdentifier)
        collectionView.register(HeaderCell.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: HeaderCell.reuseIdentifier)
        collectionView.register(SmallTableCell.self, forCellWithReuseIdentifier: SmallTableCell.reuseIdentifier)
        
        view.addSubview(collectionView)
        
        configureDataSource()
        applyShapshot()
    }
    
    private func configureDataSource() {
        dataSource = UICollectionViewDiffableDataSource(collectionView: collectionView, cellProvider: { (collectionView, indexPath, app) -> UICollectionViewCell? in
            switch self.sections[indexPath.section].type {
            case "smallTable":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: SmallTableCell.reuseIdentifier, for: indexPath) as! SmallTableCell
                cell.configure(app: app)
                return cell
            case "mediumTable":
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: MediumTableCell.reuseIdentifier, for: indexPath) as! MediumTableCell
                cell.configure(app: app)
                return cell
            default:
                let cell = collectionView.dequeueReusableCell(withReuseIdentifier: FeaturedCell.reuseIdentifier, for: indexPath) as! FeaturedCell
                cell.configure(app: app)
                return cell
            }
        })
        
        dataSource?.supplementaryViewProvider = { [weak self] collectionView, kind, indexPath in
            guard let sectionHeader = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: HeaderCell.reuseIdentifier, for: indexPath) as? HeaderCell else {
                return nil
            }

            guard let firstApp = self?.dataSource?.itemIdentifier(for: indexPath) else { return nil }
            guard let section = self?.dataSource?.snapshot().sectionIdentifier(containingItem: firstApp) else { return nil }
            if section.title.isEmpty { return nil }

            sectionHeader.title.text = section.title
            sectionHeader.subtitle.text = section.subtitle
            return sectionHeader
        }
    }
    
    private func applyShapshot() {
        var snapshot = NSDiffableDataSourceSnapshot<Section, App>()
        snapshot.appendSections(sections)
        
        for section in sections {
            snapshot.appendItems(section.items, toSection: section)
        }
        dataSource?.apply(snapshot, animatingDifferences: true)
    }
    
    private func createLayout() -> UICollectionViewCompositionalLayout {
        return UICollectionViewCompositionalLayout { (sectionIndex, environment) -> NSCollectionLayoutSection? in
            
            let section = self.sections[sectionIndex]
            
            switch section.type {
            case "smallTable":
                let layoutItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.2)))
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 20, bottom: 0, trailing: 5)

                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(250)), subitems: [layoutItem])
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                
                layoutSection.boundarySupplementaryItems = [self.createSectionHeader()]
                return layoutSection
            case "mediumTable":
                let layoutItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(0.33)))
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                
                let layoutGroup = NSCollectionLayoutGroup.vertical(layoutSize: .init(widthDimension: .fractionalWidth(0.93), heightDimension: .fractionalHeight(0.35)), subitems: [layoutItem])
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.orthogonalScrollingBehavior = .groupPagingCentered
                layoutSection.boundarySupplementaryItems = [self.createSectionHeader()]
                
                return layoutSection
            default:
                let layoutItem = NSCollectionLayoutItem(layoutSize: .init(widthDimension: .fractionalWidth(1), heightDimension: .fractionalHeight(1)))
                layoutItem.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 5)
                
                let layoutGroup = NSCollectionLayoutGroup.horizontal(layoutSize: .init(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(350)), subitems: [layoutItem])
                
                let layoutSection = NSCollectionLayoutSection(group: layoutGroup)
                layoutSection.orthogonalScrollingBehavior = .groupPagingCentered

                return layoutSection
            }
            
        }
    }
    
    private func createSectionHeader() -> NSCollectionLayoutBoundarySupplementaryItem {
        let layoutSectionHeader = NSCollectionLayoutBoundarySupplementaryItem(layoutSize: .init(widthDimension: .fractionalWidth(0.93), heightDimension: .estimated(80)), elementKind: UICollectionView.elementKindSectionHeader, alignment: .top)
        layoutSectionHeader.contentInsets = NSDirectionalEdgeInsets(top: 0, leading: 5, bottom: 0, trailing: 0)
        return layoutSectionHeader
    }
     
}
