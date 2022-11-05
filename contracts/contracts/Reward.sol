// SPDX-License-Identifier: MIT

pragma solidity ^0.8.17;
import "@openzeppelin/contracts/token/ERC20/IERC20.sol";
import "@openzeppelin/contracts/access/Ownable.sol";
import "hardhat/console.sol";

contract Reward is Ownable {
    IERC20 token;
    address admin;

    uint rewardAmount = 10 ether;

    constructor(address epicTokenAddress) {
        token = IERC20(epicTokenAddress);
        admin = msg.sender;
    }

    // アカウントのETN残高取得
    function balanceOf(address account) external view returns (uint256) {
        return token.balanceOf(account);
    }

    // 承認
    function approve(uint amount) external onlyOwner {
        token.approve(msg.sender, amount);
    }

    // Rewardに送金
    function transfer(uint amount) external onlyOwner {
        token.transferFrom(msg.sender, address(this), amount);
    }

    //　ユーザーへの報酬
    function claimReward() public {
        token.transferFrom(admin, msg.sender, rewardAmount);
    }
}
