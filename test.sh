#!/bin/bash

# Test script for Sui Web3 Project

echo "🧪 Testing Sui Web3 Project..."

# Test Move contracts (would require Sui CLI)
echo "📦 Testing Move contracts..."
if command -v sui &> /dev/null; then
    echo "  ✅ Sui CLI found, running Move tests..."
    sui move test
else
    echo "  ⚠️  Sui CLI not found, skipping Move contract tests"
    echo "     To test contracts, install Sui CLI: cargo install --locked --git https://github.com/MystenLabs/sui.git --branch devnet sui"
fi

# Test frontend
echo "🌐 Testing frontend..."
cd frontend
npm test
cd ..

echo "✅ Tests completed!"