// SPDX-License-Identifier: MIT
pragma solidity >=0.8.24;

/* Autogenerated file. Do not edit manually. */

import { IBaseWorld } from "@latticexyz/world/src/codegen/interfaces/IBaseWorld.sol";
import { IMoveSystem } from "./IMoveSystem.sol";
import { IAttackSystem } from "./IAttackSystem.sol";
import { IEntitySystem } from "./IEntitySystem.sol";
import { IHealthSystem } from "./IHealthSystem.sol";
import { IInventorySystem } from "./IInventorySystem.sol";

/**
 * @title IWorld
 * @author MUD (https://mud.dev) by Lattice (https://lattice.xyz)
 * @notice This interface integrates all systems and associated function selectors
 * that are dynamically registered in the World during deployment.
 * @dev This is an autogenerated file; do not edit manually.
 */
interface IWorld is IBaseWorld, IMoveSystem, IAttackSystem, IEntitySystem, IHealthSystem, IInventorySystem {}
