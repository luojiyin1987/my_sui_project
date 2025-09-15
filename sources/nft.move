module my_sui_project::nft {
    use std::string;
    use sui::object::{Self, ID, UID};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// A simple NFT for web3 functionality
    public struct SimpleNFT has key, store {
        id: UID,
        name: string::String,
        description: string::String,
        image_url: string::String,
    }

    /// Mint a new NFT
    public fun mint_nft(
        name: vector<u8>,
        description: vector<u8>,
        image_url: vector<u8>,
        recipient: address,
        ctx: &mut TxContext
    ) {
        let nft = SimpleNFT {
            id: object::new(ctx),
            name: string::utf8(name),
            description: string::utf8(description),
            image_url: string::utf8(image_url),
        };
        transfer::public_transfer(nft, recipient);
    }

    /// Get NFT name
    public fun name(nft: &SimpleNFT): &string::String {
        &nft.name
    }

    /// Get NFT description
    public fun description(nft: &SimpleNFT): &string::String {
        &nft.description
    }

    /// Get NFT image URL
    public fun image_url(nft: &SimpleNFT): &string::String {
        &nft.image_url
    }

    /// Burn an NFT
    public fun burn_nft(nft: SimpleNFT) {
        let SimpleNFT { id, name: _, description: _, image_url: _ } = nft;
        object::delete(id);
    }
}