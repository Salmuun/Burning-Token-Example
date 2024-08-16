pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TokenD is ERC20 {
    constructor() ERC20("Token D", "D") {
        _mint(msg.sender, 10000);
    }

      function mint() public{
        _mint(msg.sender, 10000);
    }

        function customApprove(address spender) public {
            approve(spender, 10000);
}
}
