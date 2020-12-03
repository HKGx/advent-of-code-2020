import os { get_lines }

fn main() {
	lines := get_lines()
	mapped := lines.map(it.int())
	for idx, num1 in mapped{
		for num2 in mapped[idx..] {
			if num1 + num2 == 2020 {
				println(num1 * num2)
			}
		}
	}
}