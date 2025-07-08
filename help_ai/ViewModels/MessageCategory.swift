//
//  MessageCategory.swift
//  help_ai
//
//  Created by 임또이 on 7/4/25.
//

enum MessageCategory: String, CaseIterable, Codable {
    case spam = "스팸"
    case smishing     = "스미싱 의심"
    case advertising  = "광고"
    case unknown      = "기타"
}
