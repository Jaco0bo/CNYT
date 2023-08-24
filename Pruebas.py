import unittest
import libreria_comp
class Test_libreria_comp_functions(unittest.TestCase):

    def test_suma(self):
        # (3+2i) + (-5.5.2i)
        # -2 + 7.2i
        c1 = (3,2)
        c2 = (-5,5.2)
        self.assertEqual(libreria_comp.suma_comp(c1,c2),(-2,7.2))
        # (2 + 3.3i) + (9 - 4.6i)
        # 11 - 1.3i
        c1 = (2,3.3)
        c2 = (9,-4.6)
        self.assertEqual(libreria_comp.suma_comp(c1, c2),(11, -1.3))

    def test_mult(self):
        # (3 + 2i) * (-5 + 5.2i)
        # (-25.4, 5.6)
        c1 = (3,2)
        c2 = (-5, 5.2)
        self.assertEqual(libreria_comp.mult_comp(c1, c2), (-25.4, 5.6))
        # (7.2 + 4i) * (2 - 4i)
        # (30.4, -20.8i)
        c1 = (7.2, 4)
        c2 = (2, -4)
        self.assertEqual(libreria_comp.mult_comp(c1, c2), (30.4, -20.8))

    def test_div(self):
        # (3 + 2i) / (-5 + 5.2i)
        # (-0.09, -0.49)
        c1 = (3,2)
        c2 = (-5, 5.2)
        self.assertEqual(libreria_comp.div_comp(c1, c2), (-0.09, -0.49))
        # (7.2 + 4i) * (2 - 4i)
        # (-0.08, 1.84i)
        c1 = (7.2, 4)
        c2 = (2, -4)
        self.assertEqual(libreria_comp.div_comp(c1, c2), (-0.08, 1.84))

    def test_mod(self):
        # (3 + 2i)
        # (3.61)
        c1 = (3, 2)
        self.assertEqual(libreria_comp.mod_comp(c1), 3.61)
        # (7.2 + 4i)
        # (8.24)
        c1 = (7.2, 4)
        self.assertEqual(libreria_comp.mod_comp(c1), 8.24)

    def test_conj(self):
        # (3 + 2i)
        # (3 , -2)
        c1 = (3, 2)
        self.assertEqual(libreria_comp.conj_comp(c1), (3, -2))
        # (7.2 + 2.2i)
        # (7.2, -2.2)
        c1 = (7.2, 2.2)
        self.assertEqual(libreria_comp.conj_comp(c1), (7.2, -2.2))

    def test_convcp(self):
        # (4 + 3i)
        # (5.0, 36.87)
        c1 = (4, 3)
        self.assertEqual(libreria_comp.convcp_comp(c1), (5, 36.87))
        # (7.2 + 4i)
        # (8.24, 29.05)
        c1 = (7.2, 4)
        self.assertEqual(libreria_comp.convcp_comp(c1), (8.24, 29.05))

    def test_convpc(self):
        # (5, 36.87)
        # (4 , 3)
        c1 = (5, 36.87)
        self.assertEqual(libreria_comp.convpc_comp(c1), (4, 3))
        # (8.2365041127896 , 29.054604099077146)
        # (7.2, 4)
        c1 = (8.2365041127896, 29.054604099077146)
        self.assertEqual(libreria_comp.convpc_comp(c1), (7.2, 4))

    def test_fase(self):
        # (4, 3)
        # (36.87)
        c1 = (4, 3)
        self.assertEqual(libreria_comp.fase_comp(c1), 36.87)
        # (8, -7)
        # (318.81)
        c1 = (8, -7)
        self.assertEqual(libreria_comp.fase_comp(c1),  318.81)


    def test_split(self):
        s = 'hello world'
        self.assertEqual(s.split(), ['hello', 'world'])
        # check that s.split fails when the separator is not a string
        with self.assertRaises(TypeError):
            s.split(2)

if __name__ == '__main__':
    unittest.main()