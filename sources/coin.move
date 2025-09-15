module my_sui_project::coin {
    use std::option;
    use sui::coin::{Self, Coin, TreasuryCap};
    use sui::transfer;
    use sui::tx_context::{Self, TxContext};

    /// The type identifier of the coin. The coin will have a type
    /// tag of kind: `Coin<package_object::coin::COIN>`
    public struct COIN has drop {}

    /// Module initializer is called once on module publish. A treasury
    /// cap is sent to the publisher, who then controls minting and burning
    fun init(witness: COIN, ctx: &mut TxContext) {
        let (treasury, metadata) = coin::create_currency(witness, 9, b"SUI_COIN", b"Sui Web3 Coin", b"A simple coin for web3 functionality", option::none(), ctx);
        transfer::public_freeze_object(metadata);
        transfer::public_transfer(treasury, tx_context::sender(ctx))
    }

    /// Manager can mint new coins
    public fun mint(
        treasury_cap: &mut TreasuryCap<COIN>, amount: u64, recipient: address, ctx: &mut TxContext
    ) {
        coin::mint_and_transfer(treasury_cap, amount, recipient, ctx)
    }

    /// Manager can burn coins
    public fun burn(treasury_cap: &mut TreasuryCap<COIN>, coin: Coin<COIN>) {
        coin::burn(treasury_cap, coin);
    }
}