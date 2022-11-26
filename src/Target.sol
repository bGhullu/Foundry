// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

import "../lib/forge-std/src/console.sol";
import "./interfaces/ICurve.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract target {
    address constant STETH_POOL = 0xDC24316b9AE028F1497c275EB9192a3Ea0f67022;
    address constant LP = 0x06325440D014e39736583c165C2963BA99fAf14E;
    ICurve private constant pool = ICurve(STETH_POOL);
    IERC20 private constant token = IERC20(LP);

    mapping(address => uint256) public balanceOf;

    function stake(uint256 amount) external {
        token.transferFrom(msg.sender, address(this), amount);
        balanceOf[msg.sender] += amount;
    }

    function unstake(uint256 amount) external {
        balanceOf[msg.sender] -= amount;
        token.transfer(msg.sender, amount);
    }

    function getReward() external returns (uint256) {
        uint256 reward = ((balanceOf[msg.sender] * pool.get_virtual_price()) /
            1e18);
        return reward;
    }
}
