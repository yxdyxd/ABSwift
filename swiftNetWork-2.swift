//
//  XCNetRequest.swift
//  XCNetworking
//
//  Created by 大江山岚 on 2020/12/2.
//  Copyright © 2020 大江山岚. All rights reserved.
//

import UIKit

// MARK: 创建请求体的的block
typealias XCRequestAsk = () -> Array<XCRequest>

// MARK: 上传或下载进度 callback block
typealias XCUpload = (_ progress :XCResponse) -> Void
typealias XCDownload = (_ progress :XCResponse) -> Void

// MARK: 分片请求成功或失败的 callback block
typealias XCRequestSliceSuc = (_ result : XCResponse) -> Void
typealias XCRequestSliceFai = (_ result : XCResponse) -> Void

// MARK: 全部请求完毕的 callback block
/**
 .first : 
 */
typealias XCRequestCompleted = (_ result : Array<Array<XCResponse>>) -> Void

class XCNetRequest: NSObject {
    
    static let askQueue = DispatchQueue.init(label: "XCNetworking.Ask")
    
    static func request(ask        :@escaping XCRequestAsk,
                        completed  :XCRequestCompleted?) {
        XCNetRequest.request(ask: ask,
                             upload: nil,
                             download: nil,
                             sliceFai: nil,
                             sliceSuc: nil,
                             completed: completed)
    }
    
    static func request(ask :@escaping XCRequestAsk) {
        XCNetRequest.request(ask: ask,
                             upload: nil,
                             download: nil,
                             sliceFai: nil,
                             sliceSuc: nil,
                             completed: nil)
    }
    
    static func request(ask        :@escaping XCRequestAsk,
                        sliceFai   :XCRequestSliceFai?,
                        sliceSuc   :XCRequestSliceSuc?,
                        completed  :XCRequestCompleted?) {
        
    }
    
    static func request(ask            :@escaping XCRequestAsk,
                        upload         :XCUpload?,
                        download       :XCDownload?,
                        sliceFai       :XCRequestSliceFai?,
                        sliceSuc       :XCRequestSliceSuc?,
                        completed      :XCRequestCompleted?) {
        
        askQueue.async {
            let requestAsks = ask()
            XCNetService.share.request(requests:    requestAsks,
                                       upload:      upload,
                                       download:    download,
                                       sliceFai:    sliceFai,
                                       sliceSuc:    sliceSuc,
                                       completed: completed)
        }
    }
}