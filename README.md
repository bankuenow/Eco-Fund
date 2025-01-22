# EcoFund: Decentralized Crowdfunding for Environmental Conservation

EcoFund is a decentralized platform enabling individuals to contribute to and vote on environmental conservation projects. The platform uses smart contracts to manage funds and decision-making processes, ensuring transparency and community involvement in environmental initiatives.

## Features

- Decentralized crowdfunding for environmental conservation projects
- Community-driven voting mechanism with 70% approval threshold
- Transparent fund management through smart contracts
- Extended voting period of 10 days for thorough project evaluation
- Higher minimum vote count (15) for better community representation
- Flexible deadline extensions up to 45 days
- Project cancellation and refund mechanisms

## Smart Contract Overview

The core functionality of EcoFund is implemented in a Clarity smart contract with the following key features:

- 80% funding threshold for deadline extensions
- Maximum of 3 deadline extensions
- 70% minimum vote threshold for project approval
- Minimum of 15 votes required for valid decisions
- Automatic refund mechanism for failed projects

## Getting Started

### Prerequisites

- [Clarinet](https://github.com/hirosystems/clarinet): A Clarity runtime packaged as a command line tool
- [Node.js](https://nodejs.org/) (v14 or later)
- [Stacks Wallet](https://www.hiro.so/wallet) for interacting with the Stacks blockchain

### Installation

1. Clone the repository:
   ```bash
   git clone https://github.com/yourusername/Eco-Fund.git
   cd ecofund
   ```

2. Install dependencies:
   ```bash
   npm install
   ```

3. Deploy the smart contract:
   ```bash
   clarinet deploy
   ```

## Usage

### Interacting with the Contract

1. Submit a conservation project:
   ```clarity
   (contract-call? .ecofund submit-project "Rainforest Conservation 2025" u1000000000 u31536000)
   ```

2. Contribute to a project:
   ```clarity
   (contract-call? .ecofund contribute u1 u100000000)
   ```

3. Vote on a project:
   ```clarity
   (contract-call? .ecofund vote u1 true)
   ```

4. Withdraw funds (project creators):
   ```clarity
   (contract-call? .ecofund withdraw-funds u1)
   ```

5. Request a refund (contributors):
   ```clarity
   (contract-call? .ecofund refund u1)
   ```

6. Cancel a project (creators):
   ```clarity
   (contract-call? .ecofund cancel-project u1)
   ```

7. Extend project deadline:
   ```clarity
   (contract-call? .ecofund extend-deadline u1 u32000000)
   ```

## Project Lifecycle

### Submission

1. Project creators submit their environmental conservation proposals
2. Each proposal includes:
   - Project name (max 50 characters)
   - Funding goal in STX
   - Project deadline
   - Detailed project description

### Funding

- Contributors can send STX to support projects
- All funds are held in smart contract until conditions are met
- Projects must reach 100% of goal for withdrawal
- Automatic refunds if goal isn't reached

### Voting

- 10-day voting period after funding deadline
- Minimum 15 votes required for valid decision
- 70% approval needed for fund release
- All contributors can participate in voting

### Extensions

Projects can receive deadline extensions if:
- Current funding reaches 80% of goal
- Extension request made before deadline
- Extension period ≤ 45 days
- Maximum 3 extensions per project

## Security Features

- Multi-stage approval process
- Automated fund locking and release
- Transparent voting mechanism
- Built-in refund functionality
- Deadline extension controls
- Anti-spam measures

## Development

### Testing

Run the test suite:
```bash
clarinet test
```

### Local Development

Start local development environment:
```bash
clarinet console
```

## Contributing

1. Fork the repository
2. Create your feature branch (`git checkout -b feature/AmazingFeature`)
3. Commit your changes (`git commit -m 'Add some AmazingFeature'`)
4. Push to the branch (`git push origin feature/AmazingFeature`)
5. Open a Pull Request

### Coding Standards

- Follow Clarity best practices
- Include comprehensive tests
- Document all functions
- Update README for significant changes


## Acknowledgments

- Thanks to the Stacks community for their support
- Inspired by global environmental conservation efforts
- Built on Stacks blockchain technology

## Support

For support and questions:
- Create an issue in the repository
- Join our Discord community
- Follow our Twitter for updates

## Roadmap

- Mobile application integration
- Enhanced voting mechanisms
- Multiple token support
- Cross-chain functionality
- Impact tracking metrics