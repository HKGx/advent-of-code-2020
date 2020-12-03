import sys
from subprocess import PIPE, Popen, STDOUT
from pathlib import Path
from typing import Literal

day_path = Path(f"./day{sys.argv[2]}")
part = f"part{sys.argv[3]}"
part_path = day_path / part
user_lang = sys.argv[1]

LANG = Literal["v"]


def run_string(lang: LANG, path: Path):
    if lang == "v":
        return f"v run {path.absolute()}"
    raise f'Language "{lang}" not supported!'


def check_part():
    main_file, input_file, output_file = (
        part_path / "main.v",
        day_path / "input.txt",
        part_path / "output.txt",
    )
    process = Popen(
        run_string(user_lang, main_file), stdin=PIPE, stdout=PIPE, stderr=STDOUT
    )
    with input_file.open() as file:
        lines = file.read()
    out, _ = process.communicate(lines.encode("utf-8"))
    result = str(out, "utf-8").strip()
    with output_file.open("+w") as file:
        file.write(result)
    print(result)


if __name__ == "__main__":
    check_part()
