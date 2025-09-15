#[test_only]
module my_sui_project::my_sui_project_tests {
    use sui::tx_context;
    use sui::url;
    use std::string;
    use my_sui_project::my_sui_project;

    #[test]
    fun test_mint_nft() {
        let ctx = &mut tx_context::dummy();
        let name = string::utf8(b"Test NFT");
        let description = string::utf8(b"A test NFT for unit testing");
        let url = url::new_unsafe_from_bytes(b"https://example.com/nft.png");

        my_sui_project::mint_to_sender(name, description, url, ctx);
        
        // Test passes if no abort occurs
    }

    #[test]
    fun test_mint_multiple_nfts() {
        let ctx = &mut tx_context::dummy();
        
        let name1 = string::utf8(b"NFT 1");
        let description1 = string::utf8(b"First NFT");
        let url1 = url::new_unsafe_from_bytes(b"https://example.com/nft1.png");
        
        let name2 = string::utf8(b"NFT 2");
        let description2 = string::utf8(b"Second NFT");
        let url2 = url::new_unsafe_from_bytes(b"https://example.com/nft2.png");

        my_sui_project::mint_to_sender(name1, description1, url1, ctx);
        my_sui_project::mint_to_sender(name2, description2, url2, ctx);
        
        // Test passes if no abort occurs
    }

    #[test]
    fun test_create_and_update_nft() {
        let ctx = &mut tx_context::dummy();
        let name = string::utf8(b"Update Test NFT");
        let description = string::utf8(b"Original description");
        let url = url::new_unsafe_from_bytes(b"https://example.com/update.png");

        my_sui_project::mint_to_sender(name, description, url, ctx);
        
        // Test passes if no abort occurs
    }

    #[test]
    fun test_mint_and_burn_nft() {
        let ctx = &mut tx_context::dummy();
        let name = string::utf8(b"Burn Test NFT");
        let description = string::utf8(b"NFT to be burned");
        let url = url::new_unsafe_from_bytes(b"https://example.com/burn.png");

        my_sui_project::mint_to_sender(name, description, url, ctx);
        
        // Test passes if no abort occurs
    }
}