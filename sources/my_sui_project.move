/// Module: my_sui_project
/// GitHub Avatar NFT implementation with Display support
#[allow(duplicate_alias)]
module my_sui_project::my_sui_project {
    use sui::url::{Self, Url};
    use std::string::{Self, String};
    use sui::transfer;
    use sui::object;
    use sui::tx_context::sender;
            
    /// NFT structure with key capabilities and store ability
    public struct NFT has key, store {
        id: object::UID,
        name: String,
        description: String,
        url: Url,
    }

    /// Mint a new NFT and transfer it to the sender
    public fun mint_to_sender(
        name: String,
        description: String,
        url: Url,
        ctx: &mut TxContext
    ) {
        let nft = NFT {
            id: object::new(ctx),
            name,
            description,
            url,
        };
        transfer::public_transfer(nft, sender(ctx));
    }

    /// Mint a simple NFT with GitHub avatar
    public fun mint_simple_nft(ctx: &mut TxContext) {
        let nft = NFT {
            id: object::new(ctx),
            name: string::utf8(b"GitHub Avatar NFT"),
            description: string::utf8(b"A GitHub Profile Avatar represented as an NFT"),
            url: url::new_unsafe_from_bytes(b"https://avatars.githubusercontent.com/u/6524977?s=400&u=820b593dd3657413f8c0c0a23593ddd3621d9c8e&v=4"),
        };
        transfer::public_transfer(nft, sender(ctx));
    }

    
    
    
    /// Get the NFT name
    public fun name(nft: &NFT): &String {
        &nft.name
    }

    /// Get the NFT description
    public fun description(nft: &NFT): &String {
        &nft.description
    }

    /// Get the NFT URL
    public fun url(nft: &NFT): &Url {
        &nft.url
    }

    /// Update the NFT description
    public fun update_description(
        nft: &mut NFT,
        new_description: String
    ) {
        nft.description = new_description;
    }

    /// Transfer NFT to a new owner
    public fun transfer(
        nft: NFT,
        recipient: address,
        _ctx: &TxContext
    ) {
        transfer::public_transfer(nft, recipient);
    }

    
    /// Burn an NFT
    public fun burn(
        nft: NFT
    ) {
        let NFT { id, name: _, description: _, url: _ } = nft;
        object::delete(id);
    }
}


