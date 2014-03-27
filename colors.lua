local colors = {
	blue={
		name='blue',
		visual_character={50, 50, 200},
		visual_capture_point={10, 10, 100},
		visual_base={30, 30, 120},
	},
	red={
		name='red',
		visual_character={200, 50, 50},
		visual_capture_point={100, 10, 10},
		visual_base={120, 30, 30},
	},
	neutral={
		name='neutral',
		visual_character={200, 200, 200},
		visual_capture_point={100, 100, 100},
		visual_base={0, 0, 0},
	},
}
colors.blue.opposite = colors.red
colors.red.opposite = colors.blue
colors.neutral.opposite = colors.neutral

return colors

