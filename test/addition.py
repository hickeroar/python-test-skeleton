import unittest

from skeleton.addition import Addition


class TestAddition(unittest.TestCase):

    def setUp(self) -> None:
        self.addition = Addition()

    def test_that_adding_two_numbers_yields_correct_answer(self):
        result = self.addition.add(3, 4.5)
        self.assertEquals(result, 7.5)

    def test_that_adding_non_numbers_raises_exception(self):
        with self.assertRaises(TypeError) as context:
            self.addition.add(3, 'i can count to potato')  # NOQA
        self.assertEquals('unsupported operand', str(context.exception)[:19])
