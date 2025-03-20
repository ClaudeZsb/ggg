// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

import { System } from "@latticexyz/world/src/System.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";

import { Checker } from "ggg/codegen/tables/Checker.sol";
import { Generic } from "ggg/codegen/tables/Generic.sol";

contract EntitySystem is System {
  uint256 constant HERO_COMPONENT_ID = 10000;

  // TODO: remove input entityId and generate id for the new entity
  function create(uint256 entityId, uint256[] memory componentIds, bytes[] memory data) public {
    require(!Checker.get(entityId, 0), "Entity exists");
    require(componentIds.length == data.length, "Component and data length mismatch");
    Checker.set(entityId, 0, true);
    for (uint256 i = 0; i < componentIds.length; i++) {
      require(Checker.get(componentIds[i], 0), "Component not registered");
      Checker.set(entityId, componentIds[i], true);
      Generic.set(ResourceId.wrap(_componentIdToTableId(componentIds[i])), bytes32(entityId), data[i]);
    }
  }

  function compose(uint256 entityId, uint256 componentId, bytes memory data) public {
    require(Checker.get(entityId, 0), "Entity not exists");
    require(Checker.get(componentId, 0), "Component not registered");
    Checker.set(entityId, componentId, true);
    Generic.set(ResourceId.wrap(_componentIdToTableId(componentId)), bytes32(entityId), data);
  }

  function _componentIdToTableId(uint256 componentId) internal returns (bytes32) {
    return bytes32(componentId);
  }
}
