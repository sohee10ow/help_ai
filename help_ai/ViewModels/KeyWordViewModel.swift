//
//  KeywardViewModel.swift
//  help_ai
//
//  Created by KPC-N-0036 on 7/7/25.
//

import SwiftUI

class KeyWordViewModel: ObservableObject {
    @Published var whiteList: [String] = [] //허용 문자
    @Published var blackList: [String] = [] //차단 문자
    

    private let suiteName = "group.helpai.shared"
    private let whitelistKey = "UserAllowKeywords"
    private let blacklistKey = "UserSpamKeywords"
    
    init() {
           loadKeywords()
       }

       func addWhitelist(_ keyword: String) {
           guard !keyword.isEmpty else { return }
           whiteList.append(keyword)
           save()
       }

       func addBlacklist(_ keyword: String) {
           guard !keyword.isEmpty else { return }
           blackList.append(keyword)
           save()
       }

       private func loadKeywords() {
           let defaults = UserDefaults(suiteName: suiteName)
           whiteList = defaults?.stringArray(forKey: whitelistKey) ?? []
           blackList = defaults?.stringArray(forKey: blacklistKey) ?? []
       }

       private func save() {
           let defaults = UserDefaults(suiteName: suiteName)
           defaults?.set(whiteList, forKey: whitelistKey)
           defaults?.set(blackList, forKey: blacklistKey)
       }
    
    
}


