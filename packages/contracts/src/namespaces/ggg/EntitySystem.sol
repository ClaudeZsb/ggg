// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import { System } from "@latticexyz/world/src/System.sol";

import { Checker } from "ggg/codegen/tables/Checker.sol";

contract EntitySystem is System {
  uint256 constant HERO_COMPONENT_ID = 10000;

  // TODO: remove input entityId and generate id for the new entity
  function create(uint256 entityId, uint256 componentId, bytes memory data) public {
    require(!Checker.get(entityId, 0), "Entity exists");
    require(Checker.get(componentId, 0), "Component not registered");
    Checker.set(entityId, 0, true);
    Checker.set(entityId, componentId, true);
  }

  function compose(uint256 entityId, uint256 componentId, bytes memory data) public {
    Checker.set(entityId, componentId, true);
  }
}
