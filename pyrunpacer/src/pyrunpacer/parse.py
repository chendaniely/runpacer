import re


def parse_distance_text(distance_string):
    """Parses a string into its distance and unit (in kilometers or miles)

    Returns a dictionary with keys: "distance", and "unit", e.g.,
    {"distance": 42.2, "unit": "km"}
    """
    distance_string_clean = re.sub(
        pattern=r"\s+", repl="", string=distance_string
    ).lower()

    try:
        number = float(re.search(r"\d+", distance_string_clean).group(0))
    except AttributeError:
        # when we pass in only a string, e.g., "marathon", or "half"
        number = None

    # the unit is just the string, we convert to numeric distances below
    unit = str(re.search(r"[a-zA-Z]+", distance_string_clean).group(0))

    # get the distance and units in km or mi
    if unit == "km":
        unit = "km"
        number = number
    elif unit == "m":
        unit = "km"
        number = number / 1_000
    elif unit == "mi":
        unit = "mi"
        number = number
    elif unit == "half":
        unit = "km"
        number = 21.1
    elif unit == "marathon":
        unit = "km"
        number = 42.2
    else:
        raise ValueError(
            f'Unknown unit passed. Got unit: "{unit}" and number: "{number}"'
        )

    distance_unit = {"distance": number, "unit": unit}

    return distance_unit


assert parse_distance_text("marathon") == {"distance": 42.2, "unit": "km"}
assert parse_distance_text("half") == {"distance": 21.1, "unit": "km"}
assert parse_distance_text("400m") == {"distance": 0.4, "unit": "km"}
assert parse_distance_text("5 km") == {"distance": 5, "unit": "km"}
assert parse_distance_text("10 mi") == {"distance": 10, "unit": "mi"}
