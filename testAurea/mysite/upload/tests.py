from django.test import TestCase
from ..models import File
# Create your tests here.

class FileTestCase(TestCase):
    def test_str(self):
        file = File()
        self.assertEqual(str(file),file.url)
