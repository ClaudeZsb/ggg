import { defineWorld } from "@latticexyz/world";

export default defineWorld({
  enums: {
    Direction: ["North", "East", "South", "West"],
  },
  codegen: {
    generateSystemLibraries: true,
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
        Generic: {
          schema: {
            id: "bytes32",
            value: "bytes",
          },
          key: ["id"],
          codegen: {
            tableIdArgument: true,
          },
        },
        Inventory: "bool",
        Item: "bool",
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
