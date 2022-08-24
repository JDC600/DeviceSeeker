def nested_list_contains(nl, target):
    for thing in nl:
        if type(thing) is list:
            if nested_list_contains(thing, target):
                return target
        if thing == target:
            return target
    return False

print(nested_list_contains([1, [2, [3], 4]], 3))  # True
print(nested_list_contains([1, [2, [3], 4]], 5))  # False