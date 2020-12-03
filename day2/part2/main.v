import os { get_lines }

struct Policy {
	first_position int
	second_position int
	character byte
	password string
}

fn parse_line(line string) Policy {
	split := line.split(" ")
	range := split[0].split("-")
	first_position := range[0].int()
	second_position := range[1].int()
	character := split[1][0]
	password := split[2]

	return Policy { first_position, second_position, character, password}
}

fn (policy Policy) valid() bool {
	// fancy truth table as there is no simple xor
	m := [[false, true], [true, false]]
	first_position_valid := policy.password[policy. first_position - 1] == policy.character
	second_position_valid := policy.password[policy.second_position - 1] == policy.character
	return m[int(first_position_valid)][int(second_position_valid)]
}

fn main() {
	lines := get_lines()
	policies := lines.map(parse_line(it))
	mut valid := []string{}
	for policy in policies {
		if policy.valid() {
			valid << policy.password
		}	
	}
	println(valid.len)
}
