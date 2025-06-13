def find_fewest_coins(coins, amount):
    if amount < 0:
        raise ValueError("target can't be negative")

    memo = {}
    def helper(remaining):
        if remaining in memo:
            return memo[remaining]
        if remaining == 0:
            return []

        shortest = None
        for coin in coins:
            if not (coin <= remaining <= coin * 10):
                continue

            res = helper(remaining - coin)
            if res is not None:
                combo = res + [coin]
                if shortest is None or len(combo) < len(shortest):
                    shortest = combo

        memo[remaining] = shortest
        return shortest

    result = helper(amount)

    if result is None:
        raise ValueError("can't make target with given coins")

    return sorted(result)
