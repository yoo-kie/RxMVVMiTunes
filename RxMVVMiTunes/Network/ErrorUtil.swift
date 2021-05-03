//
//  ErrorUtil.swift
//  RxMVVMiTunes
//
//  Created by 유연주 on 2021/05/03.
//

import Foundation

class ErrorUtil {
    static let instance = ErrorUtil()
    private init() {}
    
    func logError(error: APIError) {
        guard let errordesc = error.errorDescription,
              let reason = error.failureReason,
              let help = error.helpAnchor,
              let suggestion = error.recoverySuggestion
        else { return }
        
        let message = """
            ************* API ERROR **************
            ✏️ 내용 -> \(errordesc)
            ❓ 상세 사유 -> \(reason)
            ❗️ 도움말 -> \(help)
            🔑 제안 -> \(suggestion)
        """
        
        print(message)
    }
}
