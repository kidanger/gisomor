return {
  version = "1.1",
  luaversion = "5.1",
  orientation = "orthogonal",
  width = 100,
  height = 50,
  tilewidth = 32,
  tileheight = 32,
  properties = {},
  tilesets = {
    {
      name = "tileset",
      firstgid = 1,
      tilewidth = 32,
      tileheight = 32,
      spacing = 0,
      margin = 0,
      image = "../tileset.png",
      imagewidth = 256,
      imageheight = 256,
      properties = {},
      tiles = {}
    }
  },
  layers = {
    {
      type = "objectgroup",
      name = "objects",
      visible = true,
      opacity = 1,
      properties = {},
      objects = {
        {
          name = "sb1",
          type = "spawn",
          shape = "rectangle",
          x = 160,
          y = 192,
          width = 64,
          height = 64,
          visible = true,
          properties = {
            ["color"] = "blue"
          }
        },
        {
          name = "sb2",
          type = "spawn",
          shape = "rectangle",
          x = 128,
          y = 1344,
          width = 64,
          height = 64,
          visible = true,
          properties = {
            ["color"] = "blue"
          }
        },
        {
          name = "bb",
          type = "base",
          shape = "ellipse",
          x = 160,
          y = 640,
          width = 320,
          height = 320,
          visible = true,
          properties = {
            ["color"] = "blue",
            ["link1"] = "bn1",
            ["link1color"] = "red"
          }
        },
        {
          name = "bn1",
          type = "node",
          shape = "ellipse",
          x = 768,
          y = 704,
          width = 192,
          height = 192,
          visible = true,
          properties = {
            ["color"] = "blue",
            ["link1"] = "bn2",
            ["link1color"] = "red",
            ["link2"] = "bb",
            ["link2color"] = "blue",
            ["link3"] = "rn2",
            ["link3color"] = "red"
          }
        },
        {
          name = "rn2",
          type = "node",
          shape = "ellipse",
          x = 1888,
          y = 288,
          width = 192,
          height = 192,
          visible = true,
          properties = {
            ["color"] = "neutral",
            ["link1"] = "rn1",
            ["link1color"] = "red",
            ["link2"] = "bn2",
            ["link2color"] = "blue",
            ["link3"] = "bn1",
            ["link3color"] = "blue"
          }
        },
        {
          name = "bn2",
          type = "node",
          shape = "ellipse",
          x = 1248,
          y = 1152,
          width = 192,
          height = 192,
          visible = true,
          properties = {
            ["color"] = "neutral",
            ["link1"] = "bn1",
            ["link1color"] = "blue",
            ["link2"] = "rn2",
            ["link2color"] = "red",
            ["link3"] = "rn1",
            ["link3color"] = "red"
          }
        },
        {
          name = "rn1",
          type = "node",
          shape = "ellipse",
          x = 2240,
          y = 704,
          width = 192,
          height = 192,
          visible = true,
          properties = {
            ["color"] = "red",
            ["link1"] = "rn2",
            ["link1color"] = "blue",
            ["link2"] = "rb",
            ["link2color"] = "red",
            ["link3"] = "bn2",
            ["link3color"] = "blue"
          }
        },
        {
          name = "rb",
          type = "base",
          shape = "ellipse",
          x = 2720,
          y = 640,
          width = 320,
          height = 320,
          visible = true,
          properties = {
            ["color"] = "red",
            ["link1"] = "rn1",
            ["link1color"] = "blue"
          }
        },
        {
          name = "sr1",
          type = "spawn",
          shape = "rectangle",
          x = 2912,
          y = 192,
          width = 64,
          height = 64,
          visible = true,
          properties = {
            ["color"] = "red"
          }
        },
        {
          name = "sr2",
          type = "spawn",
          shape = "rectangle",
          x = 2944,
          y = 1344,
          width = 64,
          height = 64,
          visible = true,
          properties = {
            ["color"] = "red"
          }
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 0,
          y = 0,
          width = 3200,
          height = 64,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 0,
          y = 1536,
          width = 3200,
          height = 64,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 0,
          y = 64,
          width = 64,
          height = 1472,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 3136,
          y = 64,
          width = 64,
          height = 1472,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 64,
          y = 384,
          width = 672,
          height = 64,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 896,
          y = 160,
          width = 64,
          height = 384,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1248,
          y = 64,
          width = 64,
          height = 384,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 736,
          y = 544,
          width = 224,
          height = 64,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 672,
          y = 544,
          width = 64,
          height = 512,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 736,
          y = 992,
          width = 224,
          height = 64,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 896,
          y = 1056,
          width = 64,
          height = 384,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 64,
          y = 1152,
          width = 672,
          height = 64,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2240,
          y = 1056,
          width = 64,
          height = 384,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2464,
          y = 544,
          width = 64,
          height = 512,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2240,
          y = 992,
          width = 224,
          height = 64,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2240,
          y = 544,
          width = 224,
          height = 64,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2464,
          y = 384,
          width = 672,
          height = 64,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2464,
          y = 1152,
          width = 672,
          height = 64,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 2240,
          y = 160,
          width = 64,
          height = 384,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1472,
          y = 640,
          width = 288,
          height = 288,
          visible = true,
          properties = {}
        },
        {
          name = "",
          type = "wall",
          shape = "rectangle",
          x = 1856,
          y = 1152,
          width = 64,
          height = 384,
          visible = true,
          properties = {}
        }
      }
    }
  }
}
