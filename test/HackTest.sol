// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Hack.sol";

contract HackTest is Test {
    Hack public hack;

    function setUp() public {
        hack = new Hack();
    }

    function testPwn() public {
        hack.pwn{value: 10000 * 1e18}();
    }
}
