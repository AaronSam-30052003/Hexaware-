def input_is_valid(msg, start=0, end=None):
    while True:
        inp = input(msg).strip()

        if not inp.isdigit():
            print("Invalid input. Please enter a number.")
            continue

        inp = int(inp)

        if start is not None and inp < start:
            print(f"Input must be at least {start}.")
            continue

        if end is not None and inp > end:
            print(f"Input must be at most {end}.")
            continue

        return inp
