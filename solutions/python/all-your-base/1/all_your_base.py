def rebase(input_base, digits, output_base):
    if input_base < 2:
        raise ValueError("input base must be >= 2")

    if output_base < 2:
        raise ValueError("output base must be >= 2")

    if not all(0 <= d < input_base for d in digits):
        raise ValueError("all digits must satisfy 0 <= d < input base")

    in_10_base = _into_10_base(digits, input_base)
    return _into_n_base(in_10_base, output_base)

def _into_10_base(digits, input_base):
    return sum(
        d * input_base**i
        for i, d in enumerate(digits[::-1])
    )

def _into_n_base(number, output_base):
    result = []
    while number > 0:
        result.insert(0, number % output_base)
        number //= output_base

    return result or [number]
