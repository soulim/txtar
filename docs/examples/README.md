# Example: IO

In this example `Emitter` class implements method `#process`. The method
computes results for each line taken from the input and sends these results
to STDOUT.

Input format:

    <LEFT> <OPERATOR> <RIGHT>

Output format:

    <LEFT>,<OPERATOR>,<RIGHT>,<RESULT>

Examples:

    # input line
    2 + 3

    # output line
    2,+,3,5

If a line cannot be processed, sends the error message to STDERR.

---

Txtar archives are used to package different test cases. Each file represents
one case and contains data received from STDIN as well as expected output to
STDOUT and STDERR.
