//
//  ViewController.swift
//  BodyBankEnterpriseUIDemo
//
//  Created by Shunpei Kobayashi on 2018/12/12.
//  Copyright © 2018 Original Inc. All rights reserved.
//

import UIKit
import BodyBankEnterprise

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    
    func showTutorial(){
        let tutorial = BodyBankEnterprise.TutorialUI.show(on: self, animated: true, completion: nil)
        tutorial?.delegate = self
    }
    
    func showCamera(){
       let camera = BodyBankEnterprise.CameraUI.show(on: self, animated: true, completion: nil)
        camera?.delegate = self
    }
    
    func showHistoryList(){
        let historyList = BodyBankEnterprise.HistoryUI.showList(on: self, animated: true, completion: nil)
        historyList?.delegate = self
    }
    
    func showHistoryDetail(){
        BodyBankEnterprise.getEstimationRequest(id: "id") { (request, errors) in
            if let request = request{
                DispatchQueue.main.async{
                    let historyDetail = BodyBankEnterprise.HistoryUI.showDetail(on: self, request: request, animated: true, completion: nil)
                    historyDetail?.delegate = self
                }
            }
        }
    }
    

}

extension ViewController: TutorialViewControllerDelegate{
    func tutorialViewControllerDidEnd(viewController: TutorialViewController) {
       dismiss(animated: true, completion: nil)
    }
}

extension ViewController: CameraViewControllerDelegate{
    func cameraViewControllerDidCancel(viewController: CameraViewController) {
       dismiss(animated: true, completion: nil)
    }
    
    func cameraViewControllerDidFinish(viewController: CameraViewController) {
        dismiss(animated: true) {
            let param = viewController.estimationParameter
            //Use params
        }
    }
}

extension ViewController: EstimationHistoryListViewControllerDelegate{
    func estimationHistoryListViewControllerDidFinish(viewController: EstimationHistoryListViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func estimationHistoryListViewController(viewController: EstimationHistoryListViewController, didSelectEstimationRequest estimationRequest: EstimationRequest, toShowDetailViewController detailViewController: EstimationHistoryViewController) {
        
    }
}

extension ViewController: EstimationHistoryViewControllerDelegate{
    func estimationzHistoryViewControllerDidFinish(viewController: EstimationHistoryViewController) {
        dismiss(animated: true, completion: nil)
    }
    
    func estimationzHistoryViewControllerDidCancel(viewController: EstimationHistoryViewController) {
        
    }
}
