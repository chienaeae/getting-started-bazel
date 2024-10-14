def _multiple_output_rule(ctx):
    input_files = ctx.files.my_input_files
    output_files = []

    for f in input_files:
        output_file = ctx.actions.declare_file(ctx.attr.output_file_name_prefix + "_" + f.basename)
        output_files.append(output_file)


    for f, o in zip(input_files, output_files):
        ctx.actions.run_shell(
            inputs = [f],
            outputs = [o],
            command = "cat {} >> {}".format(f.path, o.path),
        )

    return DefaultInfo(files = depset(output_files))

multiple_output_rule = rule(
    implementation = _multiple_output_rule,
    attrs = {
        "my_input_files": attr.label_list(allow_files = True),
        "output_file_name_prefix": attr.string(),
    }
)
