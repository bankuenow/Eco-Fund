# EcoFund: Decentralized Crowdfunding for Environmental Conservation

EcoFund is a decentralized crowdfunding platform built on the Stacks blockchain, designed to empower environmental conservation initiatives through transparent community-driven funding and governance.

## 🌟 Features

- **Decentralized Fundraising**: Secure, transparent crowdfunding using smart contracts
- **Community Governance**: Democratic project approval with weighted voting system
- **Flexible Timelines**: Extensible deadlines with community oversight
- **Security First**: Multi-stage approval process with automated fund management
- **Transparent Operations**: All actions recorded on-chain for full accountability

## 🔧 Technical Specifications

### Smart Contract Parameters
- Minimum Approval: 70% positive votes
- Quorum Requirement: 15 minimum votes
- Extension Threshold: 80% funding achieved
- Maximum Extensions: 3 per project
- Extension Period: Up to 45 days
- Voting Duration: 10 days after funding deadline

### System Requirements
- Stacks 2.4 or later
- Clarinet 1.0 or later
- Node.js v14+
- NPM 6+

## 🚀 Quick Start

### Prerequisites

1. Install system dependencies:
   ```bash
   # Install Clarinet
   curl -sL https://install.clarinet.co | sh

   # Install Node.js & NPM
   # Visit https://nodejs.org/ for installation
   ```

2. Install Stacks Wallet for transaction signing:
   - [Hiro Wallet](https://www.hiro.so/wallet)
   - [Xverse Wallet](https://www.xverse.app/)

### Installation

```bash
# Clone repository
git clone https://github.com/yourusername/ecofund.git

# Navigate to project
cd ecofund

# Install dependencies
npm install

# Deploy contract (testnet)
clarinet deploy --testnet
```

## 💡 Usage Guide

### Project Creation

Create a new conservation project:
```clarity
(contract-call? .ecofund submit-project 
    "Amazon Rainforest Protection" 
    u1000000000 
    u31536000)
```

Required parameters:
- Project name (max 50 chars)
- Funding goal (in µSTX)
- Duration (in blocks)

### Contributing

Support a project:
```clarity
(contract-call? .ecofund contribute u1 u50000000)
```

Parameters:
- Project ID
- Amount (in µSTX)

### Voting System

Cast your vote:
```clarity
(contract-call? .ecofund vote u1 true)
```

Key voting rules:
- Only contributors can vote
- Votes cannot be changed
- 10-day voting window
- 70% approval needed

### Project Management

For project creators:
```clarity
# Extend deadline
(contract-call? .ecofund extend-deadline u1 u32000000)

# Cancel project (if no contributions)
(contract-call? .ecofund cancel-project u1)

# Withdraw funds (after successful vote)
(contract-call? .ecofund withdraw-funds u1)
```

For contributors:
```clarity
# Request refund (if project fails)
(contract-call? .ecofund refund u1)
```

## 🧪 Development

### Testing

```bash
# Run all tests
clarinet test

# Run specific test file
clarinet test tests/ecofund_test.ts

# Check contract
clarinet check
```

### Local Development

```bash
# Start REPL
clarinet console

# Deploy locally
clarinet deploy --local
```

## 🤝 Contributing

We welcome contributions! Please follow these steps:

1. Fork the repository
2. Create your feature branch: `git checkout -b feature/YourFeature`
3. Commit changes: `git commit -am 'Add YourFeature'`
4. Push to branch: `git push origin feature/YourFeature`
5. Submit a pull request

### Development Standards

- Write comprehensive unit tests
- Document all functions with clear descriptions
- Follow [Clarity coding standards](https://docs.stacks.co/writing-smart-contracts/clarity-language/language-overview)
- Update documentation for new features

## 📈 Future Roadmap

### Q2 2025
- Multi-token support (SIP-010 tokens)
- Enhanced voting mechanisms
- Mobile app integration

### Q3 2025
- Cross-chain bridge integration
- Impact measurement metrics
- DAO governance implementation

### Q4 2025
- Automated impact reporting
- Advanced analytics dashboard
- Multi-signature support

## 🌐 Community

- Discord: [Join our community](https://discord.gg/ecofund)
- Twitter: [@EcoFund](https://twitter.com/ecofund)
- Blog: [Medium](https://medium.com/ecofund)


## 🙏 Acknowledgments

- Stacks Foundation for technical support
- Environmental conservation partners
- Open-source contributors
- Community members and early adopters