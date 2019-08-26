import pytest

import nlp


tokenize_cases = [
    ("Who's on first?", ['first']),
    ("What's on second", ['second']),
    ('', []),
]


@pytest.mark.parametrize('text, expected', tokenize_cases)
def test_tokenize(text, expected):
    out = nlp.tokenize(text)
    assert out == expected, 'bad tokenize'
