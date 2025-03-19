// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import { System } from "@latticexyz/world/src/System.sol";

import { Checker } from "ggg/codegen/tables/Checker.sol";
import { Attack } from "ggg/codegen/tables/Attack.sol";

contract AttackSystem is System {
  uint256 constant ATTACK_COMPONENT_ID = 30000;

  function addAttack(uint256 entityId, uint256 amount) public {
    require(Checker.get(entityId, ATTACK_COMPONENT_ID), "Entity does not have attack component");
    uint256 newAttack = Attack.get(bytes32(entityId)) + amount;
    Attack.set(bytes32(entityId), newAttack);
  }

  function removeAttack(uint256 entityId, uint256 amount) public {
    require(Checker.get(entityId, ATTACK_COMPONENT_ID), "Entity does not have attack component");
    uint256 newAttack = Attack.get(bytes32(entityId)) - amount;
    Attack.set(bytes32(entityId), newAttack);
  }
}
