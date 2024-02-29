//
//  web3.swift
//  Copyright © 2022 Argent Labs Limited. All rights reserved.
//

import Foundation
import web3

struct TestConfig {
    // This is the proxy URL for connecting to the Blockchain. For testing we usually use the Goerli network on Infura. Using free tier, so might hit rate limits
    static let clientUrl = "https://goerli.infura.io/v3/b2f4b3f635d8425c96854c3d28ba6bb0"
    static let mainnetUrl = "https://mainnet.infura.io/v3/b2f4b3f635d8425c96854c3d28ba6bb0"

    // This is the proxy wss URL for connecting to the Blockchain. For testing we usually use the Goerli network on Infura. Using free tier, so might hit rate limits
    static let wssUrl = "wss://goerli.infura.io/ws/v3/b2f4b3f635d8425c96854c3d28ba6bb0"
    static let wssMainnetUrl = "wss://mainnet.infura.io/ws/v3/b2f4b3f635d8425c96854c3d28ba6bb0"

    // An EOA with some Ether, so that we can test sending transactions (pay for gas). Set by CI
    static let privateKey = "0x1a55418da01124db9bf94f237d84b34d3f301d82e693f5736d5834ff33fa1dc2"

    // This is the expected public key (address) from the above private key
    static let publicKey = "0x9Ca4886c6e1CA3Df41038aF1361F2feE45275953"

    // A test ERC20 token contract (UNI)
    static let erc20Contract = "0x1f9840a85d5aF5bf1D1762F925BDADdC4201F984"

    // A test ERC721 token contract (W3ST)
    static let erc721Contract = "0xb34354a70d2b985b031Ca443b87C92F7DaE5DA02"

    // ERC165 compliant contract
    static let erc165Contract = "0xA2618a1c426a1684E00cA85b5C736164AC391d35"

    static let webSocketConfig = WebSocketConfiguration(maxFrameSize: 1_000_000)

    static let network = EthereumNetwork.goerli

     enum ZKSync {
         static let chainId = 280
         static let network = EthereumNetwork.custom("\(280)")
         static let clientURL = URL(string: "https://zksync2-testnet.zksync.dev")!
    }
}


@discardableResult public func with<Root>(_ root: Root, _ block: (inout Root) throws -> Void) rethrows -> Root {
    var copy = root
    try block(&copy)
    return copy
}
