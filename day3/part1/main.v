import os { get_lines }

struct Slope {
	x int
	y int
}

fn encountered_trees_for_slope(trees []string, slope Slope) u64 {
	mut x := 0
	mut y := 0
	mut encountered_trees := u64(0)
	trees_in_row := trees[0].len
	for y < trees.len - 1 {
		x += slope.x
		y += slope.y
		if trees[y][x % trees_in_row] == `#` {
			encountered_trees = encountered_trees + 1
		}
	}
	return encountered_trees
}

fn main() {
	trees := get_lines()
	println(encountered_trees_for_slope(trees, Slope{3, 1}))
}
