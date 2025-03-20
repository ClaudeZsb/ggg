// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";

import { Checker } from "ggg/codegen/tables/Checker.sol";
import { Health } from "ggg/codegen/tables/Health.sol";
import { Attack } from "ggg/codegen/tables/Attack.sol";
import { entitySystem } from "ggg/codegen/systems/EntitySystemLib.sol";

library LibHero {
  // TODO: remove entityId
  function create(uint256 entityId, uint256 health, uint256 attack) public {
    uint256[] memory componentIds = new uint256[](2);
    componentIds[0] = uint256(ResourceId.unwrap(Health._tableId));
    componentIds[1] = uint256(ResourceId.unwrap(Attack._tableId));

    bytes[] memory data = new bytes[](2);
    data[0] = abi.encode(health);
    data[1] = abi.encode(attack);

    entitySystem.create(entityId, componentIds, data);
  }
}
