from lib.tools import compress_my_file

from nicegui import ui


def button_cmd():
    compress_my_file("input.txt", "output.txt")
    ui.notify("We compressed your file")


ui.label('Hello NiceGUI!')
ui.button('Click me', on_click=button_cmd)

ui.run()
