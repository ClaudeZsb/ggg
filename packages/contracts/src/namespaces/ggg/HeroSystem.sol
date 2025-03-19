// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import { System } from "@latticexyz/world/src/System.sol";

import { Checker } from "ggg/codegen/tables/Checker.sol";

contract HeroSystem is System {
  uint256 constant HERO_COMPONENT_ID = 10000;

  function create(uint256 heroId) public {
    Checker.set(heroId, HERO_COMPONENT_ID, true);
  }
}
