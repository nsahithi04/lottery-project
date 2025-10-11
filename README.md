# Ethereum Lottery Game

## Overview
This is a simple **Ethereum-based lottery smart contract** built using **Solidity**.  
It allows multiple players to participate in a game of luck by sending **1 Ether** each.  
Once enough players have joined, the **manager** can trigger a function to **randomly select a winner**, who will receive the **entire prize pool**.

---

## Features

- Multiple players can join the game.  
- Each player must send exactly **1 Ether** to participate.  
- The **manager** is the contract deployer and controls when to pick the winner.  
- Winner is chosen **randomly** using pseudo-random logic.  
- The entire collected Ether is automatically transferred to the winner.  
- At least **3 players** are required before picking a winner.  

---

## Smart Contract Logic

### Entities

#### Manager
- The account that deploys the contract.  
- Can trigger `pickWinner()` after a minimum of 3 players have joined.  

#### Players
- Can join by calling the `participate()` function and sending **1 Ether**.  
- Eligible to win the total collected Ether.  

---

