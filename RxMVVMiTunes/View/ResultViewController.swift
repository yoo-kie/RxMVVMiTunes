//
//  ResultViewController.swift
//  RxMVVMiTunes
//
//  Created by 유연주 on 2021/04/20.
//

import UIKit
import RxSwift
import RxCocoa

final class ResultViewController: BaseViewController {
    
    @IBOutlet var tableView: UITableView!
    
    let disposeBag = DisposeBag()
    var viewModel: SearchViewModel?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()
    }
    
    func bind() {
        viewModel?.output.tracks
            .asDriver()
            .drive(tableView.rx.items(cellIdentifier: "cell")) { row, track, cell in
                cell.textLabel?.text = track.trackName
            }
            .disposed(by: disposeBag)
        
        tableView.rx.modelSelected(Track.self)
            .subscribe(
                onNext: { [weak self] track in
                    guard let vc = DetailViewController.instantiate() else { return }
                    vc.track = track
                    self?.present(vc, animated: true, completion: nil)
                }
            )
            .disposed(by: disposeBag)
    }
    
}
