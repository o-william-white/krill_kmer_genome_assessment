
import argparse

parser = argparse.ArgumentParser(
    prog="edit_md5.py",
    description="Simple python script to edit md5sum files downloaded from CNGB",
    usage="edit_md5.py --input [INPUT] --output [OUTPUT]"
    )

parser.add_argument("--input",   help="Input md5",  required = True)
parser.add_argument("--output",  help="Output md5", required = True)
args = parser.parse_args()

with open(args.input, "r") as input:
    with open(args.output, "w") as output:
        line = input.readline().split(" ")
        file_name, file_hex = line[0], line[1]
        output.write(f"{file_hex}  results/ascp/{file_name}\n")

