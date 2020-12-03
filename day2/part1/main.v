import os { get_lines }

struct Policy {
	lower_limit int
	upper_limit int
	character string
	password string
}

fn parse_line(line string) Policy {
	split := line.split(" ")
	range := split[0].split("-")
	lower_limit := range[0].int()
	upper_limit := range[1].int()
	character := split[1][..1]
	password := split[2]

	return Policy { lower_limit, upper_limit, character, password}
}

fn (policy Policy) valid() bool {
	character_count := policy.password.count(policy.character) 
	if (character_count >= policy.lower_limit) && (character_count <= policy.upper_limit) {
		return true
	}
	return false
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
