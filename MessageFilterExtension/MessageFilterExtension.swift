//
//  MessageFilterExtension.swift
//  MessageFilterExtension
//
//  Created by 임또이 on 7/3/25.
//

import IdentityLookup

final class MessageFilterExtension: ILMessageFilterExtension {}

extension MessageFilterExtension: ILMessageFilterQueryHandling, ILMessageFilterCapabilitiesQueryHandling {
    func handle(_ capabilitiesQueryRequest: ILMessageFilterCapabilitiesQueryRequest, context: ILMessageFilterExtensionContext, completion: @escaping (ILMessageFilterCapabilitiesQueryResponse) -> Void) {
        let response = ILMessageFilterCapabilitiesQueryResponse()

        // TODO: Update subActions from ILMessageFilterSubAction enum
        // response.transactionalSubActions = [...]
        // response.promotionalSubActions   = [...]

        completion(response)
    }

    func handle(_ queryRequest: ILMessageFilterQueryRequest, context: ILMessageFilterExtensionContext, completion: @escaping (ILMessageFilterQueryResponse) -> Void) {
        // First, check whether to filter using offline data (if possible).
        let (offlineAction, offlineSubAction) = self.offlineAction(for: queryRequest)

        switch offlineAction {
        case .allow, .junk, .promotion, .transaction:
            // Based on offline data, we know this message should either be Allowed, Filtered as Junk, Promotional or Transactional. Send response immediately.
            let response = ILMessageFilterQueryResponse()
            response.action = offlineAction
            response.subAction = offlineSubAction

            completion(response)

        case .none:
            // Based on offline data, we do not know whether this message should be Allowed or Filtered. Defer to network.
            // Note: Deferring requests to network requires the extension target's Info.plist to contain a key with a URL to use. See documentation for details.
            context.deferQueryRequestToNetwork() { (networkResponse, error) in
                let response = ILMessageFilterQueryResponse()
                response.action = .none
                response.subAction = .none

                if let networkResponse = networkResponse {
                    // If we received a network response, parse it to determine an action to return in our response.
                    (response.action, response.subAction) = self.networkAction(for: networkResponse)
                } else {
                    NSLog("Error deferring query request to network: \(String(describing: error))")
                }

                completion(response)
            }

        @unknown default:
            break
        }
    }

    private func offlineAction(for queryRequest: ILMessageFilterQueryRequest) -> (ILMessageFilterAction, ILMessageFilterSubAction) {
        guard let body = queryRequest.messageBody?.lowercased() else {
            return (.none, .none)
        }

        // 기본 키워드
        let defaultSpamKeywords = ["무료", "클릭", "당첨", "대출", "택배", "검찰", "사기", "입금"]

        // 사용자 등록 키워드 (App Group 통해 공유)
        let userDefaults = UserDefaults(suiteName: "group.helpai.shared") // ← AppGroup ID
        let userKeywords = userDefaults?.stringArray(forKey: "UserSpamKeywords") ?? []

        // 전체 키워드 목록
        let allKeywords = defaultSpamKeywords + userKeywords

        // 키워드 매칭 검사
        for keyword in allKeywords {
            if body.contains(keyword) {
                return (.junk, .none) // 스팸함으로 이동
            }
        }

        return (.allow, .none) // 정상 메시지
    }

    private func networkAction(for networkResponse: ILNetworkResponse) -> (ILMessageFilterAction, ILMessageFilterSubAction) {
        // TODO: Replace with logic to parse the HTTP response and data payload of `networkResponse` to return an action.
        return (.none, .none)
    }

}
