import os { get_lines }

fn main() {
	lines := get_lines()
	mapped := lines.map(it.int())
	for idx1, num1 in mapped {
		for idx2, num2 in mapped[idx1..] {
			for num3 in mapped[idx2..] {
				if num1 + num2 + num3 == 2020 {
					println(num1 * num2 * num3)
				}
			}
		}
	}
}
