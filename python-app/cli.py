import typer

from lib.tools import compress_my_file

app = typer.Typer()


@app.command()
def hello(name: str):
    print(f"Hello {name}")


@app.command()
def goodbye(name: str, formal: bool = False):
    if formal:
        print(f"Goodbye Ms. {name}. Have a good day.")
    else:
        print(f"Bye {name}!")


@app.command()
def compress(input_file_path: str, output_file_path: str):
    compress_my_file(input_file_path, output_file_path)


if __name__ == "__main__":
    app()
