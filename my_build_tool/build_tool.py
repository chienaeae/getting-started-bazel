import sys


def __main__():
    source_file = sys.argv[1]
    target_file = sys.argv[2]

    print(f"Source file: {source_file}")
    print(f"Target file: {target_file}")

    source = open(source_file, "r")
    in_data = source.read()
    source.close()

    out_string = in_data.upper()

    target = open(target_file, "w")
    target.write(out_string)
    target.close()


if __name__ == "__main__":
    __main__()
