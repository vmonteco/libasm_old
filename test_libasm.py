#!/usr/bin/env python3

import pytest
import ctypes

libasm = ctypes.CDLL("libasm.a")

@pytest.parametrize("s", (b"", b"foo"))
def test_ft_strlen(s):
    assert libasm.ft_strlen(s) == len(s)
