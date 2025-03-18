import { defineWorld } from "@latticexyz/world";

export default defineWorld({
  enums: {
    Direction: ["North", "East", "South", "West"],
  },
  namespaces: {
    ggg: {
      tables: {
        Inventory: "bool",
        Item: "bool",
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
