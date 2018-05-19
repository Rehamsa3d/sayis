//
//  sideMenuVC.swift
//  sayis
//
//  Created by ahmedxiio on 4/1/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import UIKit
import SideMenu

class SideMenuVC: UIViewController  {
    //MARK: Properties
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var userName: UILabel!

    let items = SideMenuUtil.instance.getSideMenuDataList()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.setNavigationBarHidden(true, animated: false)
        userName.text = UserUtil.loadUser()?.first_name
        
        setupTableView()
        setupSideMenu()
        
    }

    func setupTableView() {
        
        //tableView customization
        tableView.delegate = self
        tableView.dataSource = self
        tableView.rowHeight = UITableViewAutomaticDimension
        tableView.estimatedRowHeight = 60
    }
    func setupSideMenu()  {
        // SideMenu customization
        SideMenuManager.default.menuPresentMode = .menuDissolveIn
        SideMenuManager.default.menuAllowPushOfSameClassTwice = true
        ////        SideMenuManager.default.menuAnimationFadeStrength = 0.2
        //        SideMenuManager.default.menuAnimationTransformScaleFactor = 0.9
        //       SideMenuManager.default.menuShadowOpacity = 0.3
        //        SideMenuManager.default.menuAnimationBackgroundColor = #colorLiteral(red: 0.4597069025, green: 0.4871428013, blue: 0.893885076, alpha: 0.3360961294)
    }
    
    
}

extension SideMenuVC: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableViewAutomaticDimension
    }
}

extension SideMenuVC: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: "SideMenuCell") as? SideMenuTableCell {
            let menuList = items[indexPath.row]
            cell.updatViews(sideMenuModel: menuList)
            return cell
        }
        return UITableViewCell()
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let name = items[indexPath.row].listItemID
        if name == "complaints" {
            performSegue(withIdentifier: "complaintsSegue", sender: nil)
        }
        if name == "mycar" {
            performSegue(withIdentifier: "myCarSegues", sender: nil)
        }
        if name == "myrequests" {
            performSegue(withIdentifier: "myOrdersSegues", sender: nil)
        }
        if name == "reports" {
            performSegue(withIdentifier: "reportsSegue", sender: nil)
        }
        if name == "reports1" {
            performSegue(withIdentifier: "reports1Segue", sender: nil)
        }
        if name == "settings" {
            performSegue(withIdentifier: "settingsSegue", sender: nil)
        }
        
    }
    
//    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
//        if segue.identifier == "myCarSegues" {
//            if let _ =  segue.destination as? myCarVC {
//            }
//        }
//        if segue.identifier == "myOrdersSegues" {
//            if let _ =  segue.destination as? ordersVC {
//            }
//        }
//        if segue.identifier == "complaintsSegue" {
//            if let _ =  segue.destination as? complaintsVC {
//            }
//        }
//        if segue.identifier == "reportsSegue" {
//            if let _ =  segue.destination as? reportsVC {
//            }
//        }
//        if segue.identifier == "reports1Segue" {
//            if let _ =  segue.destination as? reports1VC {
//            }
//        }
//        if segue.identifier == "settingsSegue" {
//            if let _ =  segue.destination as? settingsVC {
//            }
//        }
//    }
}


