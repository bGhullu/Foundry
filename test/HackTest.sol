// SPDX-License-Identifier: MIT

pragma solidity ^0.8.12;

import "forge-std/Test.sol";
import "forge-std/console.sol";
import "../src/Hack.sol";
import "../src/Target.sol";

contract HackTest is Test {
    Hack public hack;
    Target public target;

    function setUp() public {
        target = new Target();
        hack = new Hack(address(target));
    }

    function testPwn() public {
        hack.setUp{value: 10 * 10e18}();
        hack.pwn{value: 10000 * 1e18}();
    }
}
