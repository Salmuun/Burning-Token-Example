
pragma solidity ^0.8.0;

import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";

contract MyToken is ERC20, Ownable{
    IERC20 private tokenA;
    IERC20 private tokenB;
    IERC20 private tokenC;
    IERC20 private tokenD;

    
   
    mapping(address => mapping(address => uint256)) public userBuys;
    mapping(address => uint256) public tokenCounter;

    constructor() ERC20("SalmanToken2", "STK") Ownable(msg.sender) {
        tokenA = IERC20(0xC4eb9364f0EC344eF7d0cded7F283c24D73b25EE);
        tokenB = IERC20(0xEAE7277665f44410004F41D8a6d589a28D4b609A);
        tokenC = IERC20(0x641E2e8afbc2430E826e420450825C366f2139Ca);
        tokenD = IERC20(0xc6da6c6A8C215ADBc521eeEd0C945D93F112Fd1e);
    }

    function buy(uint256 amount) public {
        require(amount > 0, "Buy amount should be greater than 0");
        uint256 ownerShare = amount / 10; 
        uint256 burnAmount = (amount * 5) / 100;
        uint256 buyerAmount = amount - ownerShare;
        _mint(msg.sender, buyerAmount);
        _mint(owner(), ownerShare);
        burn(msg.sender, burnAmount);   
    }

    function buyToken(address tokenAddress,uint256 amount) public {
        IERC20(tokenAddress);
        require(amount > 0, "Buy amount should be greater than 0");

        require(IERC20(tokenAddress).balanceOf(msg.sender) >= amount, "Insufficient token balance");
        require(IERC20(tokenAddress).transferFrom(msg.sender, address(this), amount), "Token transfer failed");

        tokenCounter[tokenAddress] += amount;
        userBuys[msg.sender][tokenAddress] += amount; 
        buy(amount);
    }
        // if(tokenType == 1){
        //     selectedTokenType = tokenA;
        //     require(tokenA.balanceOf(msg.sender) >= amount, "Insufficient token balance");
        //     require(tokenA.transferFrom(msg.sender, address(this), amount), "Token transfer failed");

        //     tokenAcounter += amount;
        //     userBuys[msg.sender][1] += amount; 
        //     buy(amount);
        // }
        // else if(tokenType == 2){
        //     selectedTokenType = tokenB;
        //     require(tokenB.balanceOf(msg.sender) >= amount, "Insufficient token balance");
        //     require(tokenB.transferFrom(msg.sender, address(this), amount), "Token transfer failed");
        //     tokenBcounter += amount;
        //     userBuys[msg.sender][2] += amount; 
        //     buy(amount);
        // }
        // else if(tokenType == 3){
        //     selectedTokenType = tokenC;
        //     require(tokenC.balanceOf(msg.sender) >= amount, "Insufficient token balance");
        //     require(tokenC.transferFrom(msg.sender, address(this), amount), "Token transfer failed");
        //     tokenCcounter += amount;
        //     userBuys[msg.sender][3] += amount; 
        //     buy(amount);
        // }
        // else if(tokenType == 4){
        //     selectedTokenType = tokenD;
        //     require(tokenD.balanceOf(msg.sender) >= amount, "Insufficient token balance");
        //     require(tokenD.transferFrom(msg.sender, address(this), amount), "Token transfer failed");
        //     tokenDcounter += amount;
        //     userBuys[msg.sender][4] += amount; 
        //     buy(amount);
        // }
    

    function burn(address from,uint256 amount) internal {
        _burn(from, amount);
    }
}
