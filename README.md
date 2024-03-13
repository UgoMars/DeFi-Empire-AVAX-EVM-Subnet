# DeFi Empire Smart Contract on EVM Subnet

## Overview

This smart contract allows players to collect, build, and earn rewards for their participation in the game's activities.

- It has two main contracts, `ERC20` token contract and the `Vault` contract

- The ERC20-Token contract, `src/ERC20.sol`, was deployed on the `ugooSubnet` network at the contract address `0x17aB05351fC94a1a67Bf3f56DdbB941aE6c63E25` and
- The Vault contract, `src/Vault.sol` was deployed on the `ugooSubnet` network at the contract address`0x5aa01B3b5877255cE50cc55e8986a7a5fe29C70e`.
 - The vault contract is used for managing deposits and withdrawals of a specified ERC-20 token.
 - It has functionalities that allows users to deposit tokens, minting shares in proportion to the deposited amount, and later withdraw a corresponding amount of tokens based on the shares they hold.


## Demo Videos

- Demo Video Part 1

  - https://www.loom.com/share/698e6184290446ceb6bdf1c58dcf76d6?sid=fce0a5a9-349c-42fa-8500-c25d53b8160b

- Demo Video Part 2
  - https://www.loom.com/share/0c82bec75ba5467fae88996872cc4677?sid=113a8f89-02c3-447b-bc1e-3775e5674a6d


## Contract Details

- **Network:** ugooSubnet
- **Chain ID**  45632974
- **Currency Symbol**  Ugoo
- **License:** MIT

## Vault Contract Functionalities

### Deposit

- The `deposit()` function allows users to deposit ERC-20 tokens into the vault.

- This function calculates the number of shares to mint based on the deposited amount and the current total supply of shares.

```solidity
function deposit(uint _amount) external {
        uint shares;
        if (totalSupply == 0) {
            shares = _amount;
        } else {
            shares = (_amount * totalSupply) / token.balanceOf(address(this));
        }

        _mint(msg.sender, shares);
        token.transferFrom(msg.sender, address(this), _amount);
    }

```

### Withdraw

- The `withdraw` function allows users to withdraw their tokens from the vault.
- This function calculates the amount to withdraw based on the number of shares burned and the current total supply of shares.

```solidity
function withdraw(uint _shares) external {
        uint amount = (_shares * token.balanceOf(address(this))) / totalSupply;
        _burn(msg.sender, _shares);
        token.transfer(msg.sender, amount);
    }
```


## Usage Guidelines

1. **Token Approval:**
   Before depositing, ensure that you have approved the contract to spend your ERC20 tokens. Use the ERC20 `approve` function to grant the necessary permission.

```solidity
function approve(address spender, uint amount) external returns (bool);
```

2. **Deposit:**
   Call the `deposit` function with the desired amount of tokens to mint corresponding shares.

3. **Withdraw:**
   Call the `withdraw` function with the number of shares to burn and receive the proportional amount of tokens.

4. **Monitor Balances:**
   Keep track of your token balances and shares to manage deposits and withdrawals effectively, by calling the `balanceOf()`

   ```solidity
   function balanceOf(address account) external view returns (uint);
   ```

## Author

Ugo Mars
[@metacraftersio](https://github.com/UgoMars)

## License
This project is licensed under the MIT License - see the LICENSE.md file for details.

## Disclaimer

- Users are encouraged to review and understand the code before interacting with it, also this contract is deployed on `ugooSubnet` Network (my EVM subnet using the Avalanche CLI).
