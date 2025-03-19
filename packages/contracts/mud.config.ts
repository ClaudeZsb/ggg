import { defineWorld } from "@latticexyz/world";

export default defineWorld({
  enums: {
    Direction: ["North", "East", "South", "West"],
  },
  namespaces: {
    ggg: {
      tables: {
        Checker: {
          schema: {
            a: "uint256",
            b: "uint256",
            aIsB: "bool",
          },
          key: ["a", "b"],
        },
        Inventory: "bool",
        Item: "bool",
        Hero: {
          id: "uint256",
          health: "uint256",
          attack: "uint256",
        },
        Health: "uint256",
        Attack: "uint256",
      },
    },
    app: {
      tables: {
        Position: {
          schema: { player: "address", x: "int32", y: "int32" },
          key: ["player"],
        },
      },
    },
  },
});
