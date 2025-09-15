# Sui Web3 Project 🚀

A comprehensive Web3 project built on the Sui blockchain, demonstrating modern decentralized application development with Move smart contracts and a beautiful frontend interface.

## 🌟 Features

- **Custom Token (Coin)**: Mint and manage your own cryptocurrency on Sui
- **NFT Collection**: Create and trade unique digital assets
- **Web3 Frontend**: Beautiful, responsive interface for blockchain interaction
- **Move Smart Contracts**: Efficient and secure on-chain logic
- **Wallet Integration**: Connect with Sui wallet for seamless transactions

## 📁 Project Structure

```
my_sui_project/
├── Move.toml                 # Move package configuration
├── sources/                  # Move smart contracts
│   ├── coin.move            # Custom token implementation
│   └── nft.move             # NFT collection contract
├── frontend/                # Web3 frontend application
│   ├── package.json         # Frontend dependencies
│   ├── index.html          # Main HTML interface
│   └── app.js              # Web3 interaction logic
├── build.sh                # Build script
├── test.sh                 # Test script
└── README.md               # This file
```

## 🚀 Quick Start

### Prerequisites

- **Rust** (for Sui CLI installation)
- **Node.js** (for frontend development)
- **Sui Wallet** browser extension

### Installation

1. **Clone the repository**:
   ```bash
   git clone <repository-url>
   cd my_sui_project
   ```

2. **Install Sui CLI** (required for Move contract development):
   ```bash
   cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui
   ```

3. **Install frontend dependencies**:
   ```bash
   cd frontend
   npm install
   cd ..
   ```

### Building

Use the provided build script:
```bash
./build.sh
```

Or build components individually:

**Move Contracts**:
```bash
sui move build
```

**Frontend**:
```bash
cd frontend
npm run build
```

### Running

**Start the frontend development server**:
```bash
cd frontend
npm run dev
```

Then open your browser to `http://localhost:3000`

### Testing

Run all tests:
```bash
./test.sh
```

Or test components individually:

**Move Contracts**:
```bash
sui move test
```

**Frontend**:
```bash
cd frontend
npm test
```

## 🔧 Smart Contracts

### Coin Contract (`sources/coin.move`)

A custom token implementation featuring:
- Minting functionality
- Burning capability
- Treasury management
- Standard Sui coin interface

**Key Functions**:
- `mint()`: Create new tokens
- `burn()`: Destroy existing tokens

### NFT Contract (`sources/nft.move`)

A simple NFT collection with:
- Unique token creation
- Metadata storage (name, description, image)
- Transfer capabilities
- Burn functionality

**Key Functions**:
- `mint_nft()`: Create new NFTs
- `burn_nft()`: Destroy NFTs
- Getter functions for metadata

## 🌐 Frontend Features

The web interface provides:

- **Wallet Connection**: Connect your Sui wallet
- **Token Management**: Mint custom coins
- **NFT Creation**: Create and manage NFTs
- **Blockchain Info**: View balance and network status
- **Transaction Log**: Real-time activity tracking

## 📊 Deployment

### Testnet Deployment

1. **Configure Sui for testnet**:
   ```bash
   sui client new-env --alias testnet --rpc https://fullnode.testnet.sui.io:443
   sui client switch --env testnet
   ```

2. **Get testnet SUI**:
   ```bash
   sui client faucet
   ```

3. **Deploy contracts**:
   ```bash
   sui client publish --gas-budget 20000000
   ```

### Mainnet Deployment

1. **Switch to mainnet**:
   ```bash
   sui client new-env --alias mainnet --rpc https://fullnode.mainnet.sui.io:443
   sui client switch --env mainnet
   ```

2. **Deploy with sufficient gas**:
   ```bash
   sui client publish --gas-budget 100000000
   ```

## 🛠️ Development

### Adding New Features

1. **Smart Contract Changes**:
   - Edit files in `sources/`
   - Test with `sui move test`
   - Build with `sui move build`

2. **Frontend Updates**:
   - Modify `frontend/app.js` for logic
   - Update `frontend/index.html` for UI
   - Test locally with `npm run dev`

### Best Practices

- Always test contracts thoroughly before deployment
- Use appropriate gas budgets for transactions
- Keep private keys secure
- Follow Sui Move coding standards
- Implement proper error handling

## 📚 Resources

- [Sui Documentation](https://docs.sui.io/)
- [Move Language Guide](https://move-language.github.io/move/)
- [Sui TypeScript SDK](https://github.com/MystenLabs/sui/tree/main/sdk/typescript)
- [Sui Examples](https://github.com/MystenLabs/sui/tree/main/examples)

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make your changes
4. Add tests for new functionality
5. Submit a pull request

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## 🚀 What's Next?

- Deploy to Sui testnet/mainnet
- Integrate with wallet providers
- Add more complex DeFi features
- Implement governance mechanisms
- Create mobile app integration

---

**Happy building on Sui! 🌊**
