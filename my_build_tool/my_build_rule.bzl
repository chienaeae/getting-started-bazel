def _my_build_rule_impl(ctx):
    output_file = ctx.actions.declare_file(ctx.attr.output_file_name)
    input_file = ctx.file.my_input_file

    ctx.actions.run(
        inputs = [input_file],
        outputs = [output_file],
        executable = ctx.executable.my_custom_build_tool,
        arguments = [input_file.path, output_file.path],
    )
    return DefaultInfo(files = depset([output_file]))

my_build_rule = rule(
    implementation = _my_build_rule_impl,
    attrs = {
        "my_input_file": attr.label(allow_single_file = True),
        "output_file_name": attr.string(),
        "my_custom_build_tool": attr.label(
            executable = True,
            cfg = "exec"
        )
    }
)