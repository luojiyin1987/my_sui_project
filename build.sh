#!/bin/bash

# Sui Web3 Project Build Script

echo "🚀 Building Sui Web3 Project..."

# Build Move contracts (would require Sui CLI)
echo "📦 Building Move contracts..."
if command -v sui &> /dev/null; then
    echo "  ✅ Sui CLI found, building contracts..."
    sui move build
else
    echo "  ⚠️  Sui CLI not found, skipping Move contract build"
    echo "     To build contracts, install Sui CLI: cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui"
fi

# Build frontend
echo "🌐 Building frontend..."
cd frontend
npm run build
cd ..

echo "✅ Build completed!"
echo ""
echo "📝 Next steps:"
echo "   1. Install Sui CLI to build Move contracts"
echo "   2. Deploy contracts to Sui network"
echo "   3. Update frontend with actual contract addresses"
echo "   4. Run frontend: cd frontend && npm run dev"