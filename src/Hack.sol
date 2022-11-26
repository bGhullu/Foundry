// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

import "../lib/forge-std/src/console.sol";
import "./interfaces/ICurve.sol";
import "../lib/openzeppelin-contracts/contracts/token/ERC20/IERC20.sol";

contract Hack {
    address constant STETH_POOL = 0xDC24316b9AE028F1497c275EB9192a3Ea0f67022;
    address constant LP = 0x06325440D014e39736583c165C2963BA99fAf14E;
    ICurve private constant pool = ICurve(STETH_POOL);
    IERC20 private constant lpToken = IERC20(LP);

    function pwn() external payable {}
}
