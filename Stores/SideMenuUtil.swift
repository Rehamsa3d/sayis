//
//  sideMenuUtil.swift
//  sayis
//
//  Created by ahmedxiio on 4/2/18.
//  Copyright © 2018 ahmedxiio. All rights reserved.
//

import Foundation
class SideMenuUtil  {
static let instance = SideMenuUtil()
    private let SideMenuDataList = [
        SideMenuModel(listIemName:"طلباتي",listIemImagName:"side_menu_myrequests_icon.png",listItembackImge:"side_menu_next_icon",listItemID:"myrequests"),
        SideMenuModel(listIemName:"رصيدي",listIemImagName:"side_menu_reports_icon.png",listItembackImge:"side_menu_next_icon",listItemID:"reports"),
        SideMenuModel(listIemName:"سيارتي",listIemImagName:"side_menu_mycar_icon.png",listItembackImge:"side_menu_next_icon",listItemID:"mycar"),
        SideMenuModel(listIemName:"طرق الدفع",listIemImagName:"side_menu_payment_icon.png",listItembackImge:"side_menu_next_icon",listItemID:"payment"),
        SideMenuModel(listIemName:"تقارير الرحلات",listIemImagName:"side_menu_reports_icon.png",listItembackImge:"side_menu_next_icon",listItemID:"reports1"),
        SideMenuModel(listIemName:"الشكاوي",listIemImagName:"side_menu_complaints_icon.png",listItembackImge:"side_menu_next_icon",listItemID:"complaints"),
        SideMenuModel(listIemName:"الاعدادات",listIemImagName:"side_menu_settings_icon.png",listItembackImge:"side_menu_next_icon",listItemID:"settings")
    ]
    func getSideMenuDataList() -> [SideMenuModel] {
        return SideMenuDataList
    }
}
