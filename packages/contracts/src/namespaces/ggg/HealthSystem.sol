// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import { System } from "@latticexyz/world/src/System.sol";

import { Checker } from "ggg/codegen/tables/Checker.sol";
import { Health } from "ggg/codegen/tables/Health.sol";

contract HealthSystem is System {
  uint256 constant HEALTH_COMPONENT_ID = 20000;

  function addHealth(uint256 entityId, uint256 amount) public {
    require(Checker.get(entityId, HEALTH_COMPONENT_ID), "Entity does not have health component");
    uint256 newHealth = Health.get(bytes32(entityId)) + amount;
    Health.set(bytes32(entityId), newHealth);
  }

  function removeHealth(uint256 entityId, uint256 amount) public {
    require(Checker.get(entityId, HEALTH_COMPONENT_ID), "Entity does not have health component");
    uint256 newHealth = Health.get(bytes32(entityId)) - amount;
    Health.set(bytes32(entityId), newHealth);
  }
}
