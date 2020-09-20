import sys

fda = None

if sys.platform == 'win32':
	import win32api
	import win32com.client

	win32api.SetDllDirectory(r'C:\MModal\Server')
	fda = win32com.client.Dispatch("FDLink.Application")

def disable_fd():
	if fda is None:
		return

	fdas = fda.Connect()
	if fdas is None:
		return # unable to connect

	# this just turns on/off dictation; leaves commands enabled
	# fddc = fdas.GetDictationControl()
	# fddc.SetEnabled(True)

	# can turn OFF microphone this way; turning it back on does nothing
	fdrc = fdas.GetRecordingControl()
	fdrc.EnableRecording(False)

if __name__ == '__main__':
	disable_fd()
