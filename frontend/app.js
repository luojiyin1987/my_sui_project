// Simple Web3 functionality demonstration for Sui blockchain
class SuiWeb3App {
    constructor() {
        this.wallet = null;
        this.provider = null;
        this.connected = false;
        this.init();
    }

    init() {
        this.setupEventListeners();
        this.log('Welcome to Sui Web3 DApp! 🚀');
        this.checkWalletAvailability();
    }

    setupEventListeners() {
        document.getElementById('connectWallet').addEventListener('click', () => this.connectWallet());
        document.getElementById('mintCoin').addEventListener('click', () => this.mintCoin());
        document.getElementById('mintNFT').addEventListener('click', () => this.mintNFT());
        document.getElementById('getBalance').addEventListener('click', () => this.getBalance());
        document.getElementById('getNetworkInfo').addEventListener('click', () => this.getNetworkInfo());
    }

    checkWalletAvailability() {
        if (typeof window.suiWallet !== 'undefined') {
            this.updateStatus('walletStatus', 'Sui Wallet detected! Click connect to start.', 'success');
        } else {
            this.updateStatus('walletStatus', 'No Sui wallet detected. Please install Sui Wallet extension.', 'error');
        }
    }

    async connectWallet() {
        try {
            this.log('Attempting to connect wallet...');
            
            // Simulate wallet connection for demo purposes
            // In a real app, you would use: await window.suiWallet.requestPermissions()
            setTimeout(() => {
                this.connected = true;
                this.updateStatus('walletStatus', 'Wallet connected successfully! ✅', 'success');
                this.enableButtons();
                this.log('Wallet connected successfully!');
            }, 1000);
            
        } catch (error) {
            this.updateStatus('walletStatus', `Connection failed: ${error.message}`, 'error');
            this.log(`Wallet connection error: ${error.message}`);
        }
    }

    async mintCoin() {
        const recipient = document.getElementById('mintRecipient').value;
        const amount = document.getElementById('mintAmount').value;

        if (!recipient || !amount) {
            this.updateStatus('coinStatus', 'Please fill in all fields', 'error');
            return;
        }

        try {
            this.log(`Minting ${amount} coins to ${recipient}...`);
            
            // Simulate transaction
            setTimeout(() => {
                const txHash = this.generateMockTxHash();
                this.updateStatus('coinStatus', `Coins minted successfully! TX: ${txHash}`, 'success');
                this.log(`✅ Minted ${amount} coins to ${recipient} (TX: ${txHash})`);
            }, 2000);
            
        } catch (error) {
            this.updateStatus('coinStatus', `Minting failed: ${error.message}`, 'error');
            this.log(`❌ Coin minting error: ${error.message}`);
        }
    }

    async mintNFT() {
        const name = document.getElementById('nftName').value;
        const description = document.getElementById('nftDescription').value;
        const imageUrl = document.getElementById('nftImageUrl').value;
        const recipient = document.getElementById('nftRecipient').value;

        if (!name || !description || !imageUrl || !recipient) {
            this.updateStatus('nftStatus', 'Please fill in all fields', 'error');
            return;
        }

        try {
            this.log(`Minting NFT "${name}" to ${recipient}...`);
            
            // Simulate NFT minting
            setTimeout(() => {
                const txHash = this.generateMockTxHash();
                this.updateStatus('nftStatus', `NFT "${name}" minted successfully! TX: ${txHash}`, 'success');
                this.log(`🎨 Minted NFT "${name}" to ${recipient} (TX: ${txHash})`);
            }, 2500);
            
        } catch (error) {
            this.updateStatus('nftStatus', `NFT minting failed: ${error.message}`, 'error');
            this.log(`❌ NFT minting error: ${error.message}`);
        }
    }

    async getBalance() {
        try {
            this.log('Fetching SUI balance...');
            
            // Simulate balance fetch
            setTimeout(() => {
                const balance = (Math.random() * 100).toFixed(4);
                this.updateStatus('blockchainStatus', `Current SUI Balance: ${balance} SUI`, 'success');
                this.log(`💰 Current balance: ${balance} SUI`);
            }, 1500);
            
        } catch (error) {
            this.updateStatus('blockchainStatus', `Failed to fetch balance: ${error.message}`, 'error');
            this.log(`❌ Balance fetch error: ${error.message}`);
        }
    }

    async getNetworkInfo() {
        try {
            this.log('Fetching network information...');
            
            // Simulate network info fetch
            setTimeout(() => {
                const networkInfo = {
                    network: 'Devnet',
                    version: '1.56.0',
                    chainId: 'sui:devnet'
                };
                this.updateStatus('blockchainStatus', 
                    `Network: ${networkInfo.network} | Version: ${networkInfo.version} | Chain: ${networkInfo.chainId}`, 
                    'success'
                );
                this.log(`🌐 Network: ${networkInfo.network}, Version: ${networkInfo.version}`);
            }, 1000);
            
        } catch (error) {
            this.updateStatus('blockchainStatus', `Failed to fetch network info: ${error.message}`, 'error');
            this.log(`❌ Network info error: ${error.message}`);
        }
    }

    updateStatus(elementId, message, type = '') {
        const element = document.getElementById(elementId);
        element.style.display = 'block';
        element.textContent = message;
        element.className = `status ${type}`;
    }

    enableButtons() {
        document.getElementById('mintCoin').disabled = false;
        document.getElementById('mintNFT').disabled = false;
    }

    generateMockTxHash() {
        return '0x' + Array.from({length: 64}, () => Math.floor(Math.random() * 16).toString(16)).join('');
    }

    log(message) {
        const logElement = document.getElementById('transactionLog');
        const timestamp = new Date().toLocaleTimeString();
        const logEntry = document.createElement('div');
        logEntry.style.cssText = 'padding: 8px; margin: 4px 0; background: rgba(255,255,255,0.1); border-radius: 8px; border-left: 3px solid #2196F3;';
        logEntry.innerHTML = `<small>${timestamp}</small><br>${message}`;
        logElement.appendChild(logEntry);
        logElement.scrollTop = logElement.scrollHeight;
    }
}

// Initialize the app when the page loads
document.addEventListener('DOMContentLoaded', () => {
    new SuiWeb3App();
});

// Export for potential testing
if (typeof module !== 'undefined' && module.exports) {
    module.exports = SuiWeb3App;
}