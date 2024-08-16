pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";

contract TokenA is ERC20 {
    constructor() ERC20("Token A", "A") {
        _mint(msg.sender, 10000);
        
    }

    function mint() public{
        _mint(msg.sender, 10000);
        
    }

        function customApprove(address spender) public {
            approve(spender, 10000);
}
}
