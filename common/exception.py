class CustomException:
	def __init__(self, message, status_code):
		self.message = message
		self.status_code = status_code

	def __str__(self):
		return self.message