// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

import { AttackSystem } from "../../AttackSystem.sol";
import { revertWithBytes } from "@latticexyz/world/src/revertWithBytes.sol";
import { IWorldCall } from "@latticexyz/world/src/IWorldKernel.sol";
import { SystemCall } from "@latticexyz/world/src/SystemCall.sol";
import { WorldContextConsumerLib } from "@latticexyz/world/src/WorldContext.sol";
import { Systems } from "@latticexyz/world/src/codegen/tables/Systems.sol";
import { ResourceId } from "@latticexyz/store/src/ResourceId.sol";
import { StoreSwitch } from "@latticexyz/store/src/StoreSwitch.sol";

type AttackSystemType is bytes32;

// equivalent to WorldResourceIdLib.encode({ typeId: RESOURCE_SYSTEM, namespace: "ggg", name: "AttackSystem" }))
AttackSystemType constant attackSystem = AttackSystemType.wrap(
  0x7379676767000000000000000000000041747461636b53797374656d00000000
);

struct CallWrapper {
  ResourceId systemId;
  address from;
}

struct RootCallWrapper {
  ResourceId systemId;
  address from;
}

/**
 * @title AttackSystemLib
 * @author MUD (https://mud.dev) by Lattice (https://lattice.xyz)
 * @dev This library is automatically generated from the corresponding system contract. Do not edit manually.
 */
library AttackSystemLib {
  error AttackSystemLib_CallingFromRootSystem();

  function addAttack(AttackSystemType self, uint256 entityId, uint256 amount) internal {
    return CallWrapper(self.toResourceId(), address(0)).addAttack(entityId, amount);
  }

  function removeAttack(AttackSystemType self, uint256 entityId, uint256 amount) internal {
    return CallWrapper(self.toResourceId(), address(0)).removeAttack(entityId, amount);
  }

  function addAttack(CallWrapper memory self, uint256 entityId, uint256 amount) internal {
    // if the contract calling this function is a root system, it should use `callAsRoot`
    if (address(_world()) == address(this)) revert AttackSystemLib_CallingFromRootSystem();

    bytes memory systemCall = abi.encodeCall(_addAttack_uint256_uint256.addAttack, (entityId, amount));
    self.from == address(0)
      ? _world().call(self.systemId, systemCall)
      : _world().callFrom(self.from, self.systemId, systemCall);
  }

  function removeAttack(CallWrapper memory self, uint256 entityId, uint256 amount) internal {
    // if the contract calling this function is a root system, it should use `callAsRoot`
    if (address(_world()) == address(this)) revert AttackSystemLib_CallingFromRootSystem();

    bytes memory systemCall = abi.encodeCall(_removeAttack_uint256_uint256.removeAttack, (entityId, amount));
    self.from == address(0)
      ? _world().call(self.systemId, systemCall)
      : _world().callFrom(self.from, self.systemId, systemCall);
  }

  function addAttack(RootCallWrapper memory self, uint256 entityId, uint256 amount) internal {
    bytes memory systemCall = abi.encodeCall(_addAttack_uint256_uint256.addAttack, (entityId, amount));
    SystemCall.callWithHooksOrRevert(self.from, self.systemId, systemCall, msg.value);
  }

  function removeAttack(RootCallWrapper memory self, uint256 entityId, uint256 amount) internal {
    bytes memory systemCall = abi.encodeCall(_removeAttack_uint256_uint256.removeAttack, (entityId, amount));
    SystemCall.callWithHooksOrRevert(self.from, self.systemId, systemCall, msg.value);
  }

  function callFrom(AttackSystemType self, address from) internal pure returns (CallWrapper memory) {
    return CallWrapper(self.toResourceId(), from);
  }

  function callAsRoot(AttackSystemType self) internal view returns (RootCallWrapper memory) {
    return RootCallWrapper(self.toResourceId(), WorldContextConsumerLib._msgSender());
  }

  function callAsRootFrom(AttackSystemType self, address from) internal pure returns (RootCallWrapper memory) {
    return RootCallWrapper(self.toResourceId(), from);
  }

  function toResourceId(AttackSystemType self) internal pure returns (ResourceId) {
    return ResourceId.wrap(AttackSystemType.unwrap(self));
  }

  function fromResourceId(ResourceId resourceId) internal pure returns (AttackSystemType) {
    return AttackSystemType.wrap(resourceId.unwrap());
  }

  function getAddress(AttackSystemType self) internal view returns (address) {
    return Systems.getSystem(self.toResourceId());
  }

  function _world() private view returns (IWorldCall) {
    return IWorldCall(StoreSwitch.getStoreAddress());
  }
}

/**
 * System Function Interfaces
 *
 * We generate an interface for each system function, which is then used for encoding system calls.
 * This is necessary to handle function overloading correctly (which abi.encodeCall cannot).
 *
 * Each interface is uniquely named based on the function name and parameters to prevent collisions.
 */

interface _addAttack_uint256_uint256 {
  function addAttack(uint256 entityId, uint256 amount) external;
}

interface _removeAttack_uint256_uint256 {
  function removeAttack(uint256 entityId, uint256 amount) external;
}

using AttackSystemLib for AttackSystemType global;
using AttackSystemLib for CallWrapper global;
using AttackSystemLib for RootCallWrapper global;
