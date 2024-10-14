def _single_output_rule(ctx):
    output_file = ctx.actions.declare_file(ctx.attr.output_file_name + ".txt")
    input_files = ctx.files.my_input_files

    ctx.actions.run_shell(
        inputs = input_files,
        outputs = [output_file],
        command = "cat {} >> {}".format(
            " ".join([f.path for f in input_files]),
            output_file.path
        )

    )
    return DefaultInfo(files = depset([output_file]))

single_output_rule = rule(
    implementation = _single_output_rule,
    attrs = {
        "my_input_files": attr.label_list(allow_files = True),
        "output_file_name": attr.string(),
    }
)