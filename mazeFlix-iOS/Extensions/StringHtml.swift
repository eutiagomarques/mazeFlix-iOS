//
//  StringHtml.swift
//  mazeFlix-iOS
//
//  Created by Tiago Marques on 04/06/21.
//

import Foundation

extension String {
    func htmlAttributedString() throws -> String?  {
        if isEmpty {
            return nil
        }
        
        if let data = data(using: .utf8) {
            let attributedString = try NSAttributedString(data: data,
                                                          options: [.documentType : NSAttributedString.DocumentType.html,
                                                                    .characterEncoding: String.Encoding.utf8.rawValue],
                                                          documentAttributes: nil)
            var string = attributedString.string
           
            string = string.replacingOccurrences(of: "\u{FFFC}",
                                                 with: "",
                                                 options: .regularExpression,
                                                 range: nil)
            string = string.replacingOccurrences(of: "(\n){3,}",
                                                 with: "\n\n",
                                                 options: .regularExpression,
                                                 range: nil)
            return string.trimmingCharacters(in: .whitespacesAndNewlines)
        }
        
        return nil
    }
}
