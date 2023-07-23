//
//  TransferableUIImage.swift
//  MC3Team18
//
//  Created by ChoiYujin on 2023/07/23.
//

import SwiftUI

struct TransferableUIImage: Transferable {
    static var transferRepresentation: some TransferRepresentation {
        ProxyRepresentation(exporting: \.image)
    }
    
    public var uiimage: UIImage
    public var image: Image {
        return Image(uiImage: uiimage)
    }
    public var caption: String
}
